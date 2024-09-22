from PySide6.QtCore import QAbstractListModel, QModelIndex, Qt, QUrl
import tmdbsimple as tmdb

tmdb.API_KEY = "83cbec0139273280b9a3f8ebc9e35ca9"
tmdb.REQUESTS_TIMEOUT = 5

POSTER_TOOT = "https://image.tmdb.org/t/p/w300"

class MovieList(QAbstractListModel):
    DataRole = Qt.UserRole

    def __init__(self):
        super().__init__()
        self.__movies = []

        self.fetch_movies()

    def fetch_movies(self):
        movies = tmdb.Movies()
        popular_movies = movies.popular(page=1).get("results")

        for i in popular_movies:
            title = i.get("title")
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