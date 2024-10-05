from PySide6.QtCore import (QAbstractListModel, QModelIndex, 
                            Qt, QObject, QRunnable, Signal, QThreadPool,
                            Property, QSortFilterProxyModel, Slot
                            )
import tmdbsimple as tmdb
from datetime import datetime

tmdb.API_KEY = "83cbec0139273280b9a3f8ebc9e35ca9"
tmdb.REQUESTS_TIMEOUT = 5

POSTER_TOOT = "https://image.tmdb.org/t/p/w300"

class MovieList(QAbstractListModel):
    DataRole = Qt.UserRole
    download_progress_changed = Signal()

    def __init__(self):
        super().__init__()
        self.__movies = []

        # Create a jobpool for our worker
        self.__job_pool = QThreadPool()
        self.__job_pool.setMaxThreadCount(1)

        # Create our worker
        self.__movie_list_worker = MovieListWorker(max_pages=20)
        
        # Connect to its signals here
        self.__movie_list_worker.signals.task_finished.connect(self.__insert_movie)

        self.__fetch()

    def __fetch(self):
        self.download_progress_changed.emit()

        # Start job pool
        self.__job_pool.start(self.__movie_list_worker)
    
    def __insert_movie(self, movie_data):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.__movies.append(movie_data)
        self.endInsertRows()

        self.download_progress_changed.emit()
        
    def rowCount(self, parent=QModelIndex):
        return len(self.__movies)

    def roleNames(self):
        return {MovieList.DataRole: b"movie"}
    
    def data(self, index, role=Qt.DisplayRole):
        row = index.row()
        if role == MovieList.DataRole:
            return self.__movies[row]

    def __get_is_downloading(self):
        return self.__movie_list_worker.working
    
    def __get_download_current_value(self):
        return self.__movie_list_worker.current_value
    
    def __get_download_max_value(self):
        return self.__movie_list_worker.max_value

    @property
    def movies(self):
        return tuple(self.__movies)

    is_downloading = Property(bool, __get_is_downloading, notify=download_progress_changed)
    download_current_value = Property(int, __get_download_current_value, notify=download_progress_changed)
    download_max_value = Property(int, __get_download_max_value, notify=download_progress_changed)

class MovieListProxy(QSortFilterProxyModel):
    def __init__(self):
        super().__init__()
        self.sort(0, Qt.AscendingOrder)

        self.__title_filter = ""
        self.__genre_filter = ""

    @Slot(str)
    def set_search(self, search_string):
        self.__title_filter = search_string
        self.invalidateFilter()
    
    def filterAcceptsRow(self, source_row, source_parent):
        movie_data = self.sourceModel().movies[source_row]
        return self.__title_filter.lower() in movie_data["title"].lower()

# Threading
class WorkerSignals(QObject):
    task_finished = Signal(dict)

    def __init__(self):
        super().__init__()

class MovieListWorker(QRunnable):
    def __init__(self, max_pages):
        super().__init__()
        self.signals = WorkerSignals()
        self.__movies = tmdb.Movies()
        self.working = False
        self.current_value = 0
        self.max_value = 0
        self.max_pages = max_pages

        self.__movie_genres = {}
        for i in tmdb.Genres().movie_list()["genres"]:
            self.__movie_genres[i.get("id")] = i.get("name")

    def run(self):
        self.current_value = 0
        self.max_value = 0
        self.working = True
        self.__fetch()
        self.working = False

    def __get_genres(self, genre_id_list):
        if not genre_id_list:
            return []
        
        return [self.__movie_genres[i] for i in genre_id_list]

    def __fetch(self):
        for page in range(1, self.max_pages + 1):
            popular_movies = self.__movies.popular(page=page).get("results")

            if self.max_value == 0:
                self.max_value = len(popular_movies) * self.max_pages
        
            for i in popular_movies:
                self.current_value += 1
                title = i.get("title")
                release_date = datetime.strptime(i.get("release_date"), "%Y-%m-%d")
                vote_average = int(round(i.get("vote_average") * 10))
                poster_path = f"{POSTER_TOOT}{i.get('poster_path')}"

                movie_data = {
                    "title": title,
                    "display_date": release_date.strftime("%Y %B %d"),
                    "sort_date": release_date,
                    "vote_average": vote_average,
                    "poster_path": poster_path,
                    "genres": self.__get_genres(i.get("genre_ids"))
                }

                self.signals.task_finished.emit(movie_data)