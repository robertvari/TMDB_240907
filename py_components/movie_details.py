from PySide6.QtCore import QObject, Slot, Property, Signal
from datetime import datetime, timedelta
import tmdbsimple as tmdb

POSTER_ROOT = "https://image.tmdb.org/t/p/w300"
BACKDROP_ROOT = "https://image.tmdb.org/t/p/w1920_and_h800_multi_faces"

class MovieDetails(QObject):
    movie_changed = Signal()

    def __init__(self):
        super().__init__()
        self.__movie_data = None
    
    @Slot(int)
    def set_movie(self, movie_id):
        movie = tmdb.Movies(movie_id)
        self.__movie_data = movie.info()
        self.movie_changed.emit()
    
    def __get_title(self):
        if not self.__movie_data:
            return ""
        
        title = self.__movie_data.get("title")
        year = self.__get_date_object().year
        
        return f"{title} ({year})"
    
    def __get_date_object(self):
        return datetime.strptime(self.__movie_data["release_date"], "%Y-%m-%d")
    
    def __get_poster(self):
        if not self.__movie_data:
            return ""
        return f"{POSTER_ROOT}{self.__movie_data.get('poster_path')}"
    
    def __get_backdrop(self):
        if not self.__movie_data:
            return ""

        return f"{BACKDROP_ROOT}{self.__movie_data.get('backdrop_path')}"
    
    def _get_date_genres_runtime(self):
        if not self.__movie_data:
            return ""
        
        date = self.__get_date_object().strftime("%Y-%m-%d")
        genres = ", ".join([i.get("name") for i in self.__movie_data["genres"]])
        t_delta = timedelta(minutes=self.__movie_data.get("runtime"))
        h, m, s = str(t_delta).split(":")
        runtime = f"{h}h {m}m"
        
        return f"{date} - {genres} - {runtime}"
    
    def __get_popularity(self):
        if not self.__movie_data:
            return 0
        
        return int(round(self.__movie_data.get("vote_average") * 10))
    
    def __get_tagline(self):
        if not self.__movie_data:
            return ""
        return self.__movie_data.get("tagline")
    
    def __get_overview(self):
        if not self.__movie_data:
            return ""
        
        return self.__movie_data.get("overview")
    
    title = Property(str, __get_title, notify=movie_changed)
    poster = Property(str, __get_poster, notify=movie_changed)
    backdrop = Property(str, __get_backdrop, notify=movie_changed)
    date_genres_runtime = Property(str, _get_date_genres_runtime, notify=movie_changed)
    popularity = Property(int, __get_popularity, notify=movie_changed)
    tagline = Property(str, __get_tagline, notify=movie_changed)
    overview = Property(str, __get_overview, notify=movie_changed)