from PySide6.QtCore import QAbstractListModel, QModelIndex, Qt, QObject, QRunnable, Signal, QThreadPool
import tmdbsimple as tmdb
import time

tmdb.API_KEY = "83cbec0139273280b9a3f8ebc9e35ca9"
tmdb.REQUESTS_TIMEOUT = 5

POSTER_TOOT = "https://image.tmdb.org/t/p/w300"

class MovieList(QAbstractListModel):
    DataRole = Qt.UserRole

    def __init__(self):
        super().__init__()
        self.__movies = []

        # Create a jobpool for our worker
        self.__job_pool = QThreadPool()
        self.__job_pool.setMaxThreadCount(1)

        # Create our worker
        self.__movie_list_worker = MovieListWorker()
        
        # Connect to its signals here
        self.__movie_list_worker.signals.task_finished.connect(self.__insert_movie)

        self.__fetch()

    def __fetch(self):
        # Start job pool
        self.__job_pool.start(self.__movie_list_worker)
    
    def __insert_movie(self, movie_data):
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self.__movies.append(movie_data)
        self.endInsertRows()

    def fetch_movies_old(self):
        print("Start fetching movies")
        movies = tmdb.Movies()
        popular_movies = movies.popular(page=1).get("results")

        for i in popular_movies:
            title = i.get("title")
            print(f"Add movie: {title}")
            release_date = i.get("release_date")
            vote_average = int(round(i.get("vote_average") * 10))
            poster_path = f"{POSTER_TOOT}{i.get('poster_path')}"

            self.__movies.append({
                "title": title,
                "release_date": release_date,
                "vote_average": vote_average,
                "poster_path": poster_path
            })
        
    def rowCount(self, parent=QModelIndex):
        return len(self.__movies)

    def roleNames(self):
        return {MovieList.DataRole: b"movie"}
    
    def data(self, index, role=Qt.DisplayRole):
        row = index.row()
        if role == MovieList.DataRole:
            return self.__movies[row]



# Threading
class WorkerSignals(QObject):
    task_finished = Signal(dict)

    def __init__(self):
        super().__init__()

class MovieListWorker(QRunnable):
    def __init__(self):
        super().__init__()
        self.signals = WorkerSignals()
        self.__movies = tmdb.Movies()

    def run(self):
        self.__fetch()

    def __fetch(self):
        popular_movies = self.__movies.popular(page=1).get("results")
        
        for i in popular_movies:
            time.sleep(0.5)
            title = i.get("title")
            release_date = i.get("release_date")
            vote_average = int(round(i.get("vote_average") * 10))
            poster_path = f"{POSTER_TOOT}{i.get('poster_path')}"

            movie_data = {
                "title": title,
                "release_date": release_date,
                "vote_average": vote_average,
                "poster_path": poster_path
            }

            self.signals.task_finished.emit(movie_data)