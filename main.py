from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
import os, sys
from py_components.resources import Resources
from py_components.movie_list import MovieList, MovieListProxy
from py_components.movie_details import MovieDetails

APP_ROOT = os.path.dirname(__file__)
MAIN_QML = os.path.join(APP_ROOT, "main.qml")

class TMDB:
    def __init__(self):
        # Create an instace of the QGuiApplication
        self.app = QGuiApplication(sys.argv)

        # Instance of QQmlApplicationEngine
        self.engine = QQmlApplicationEngine()

        # Get root context from engine
        self.context = self.engine.rootContext()
        
        # Create an instance of our Resource class
        self.resources = Resources()
        self.context.setContextProperty("Resources", self.resources)

        self.movie_list = MovieList()
        self.context.setContextProperty("MovieList", self.movie_list)

        self.movie_list_proxy = MovieListProxy()
        self.movie_list_proxy.setSourceModel(self.movie_list)
        self.context.setContextProperty("MovieListProxy", self.movie_list_proxy)

        # Insert Movie details into context
        self.movie_details = MovieDetails()
        self.context.setContextProperty("MovieDetails", self.movie_details)
        
        # Load main.qml
        self.engine.load(MAIN_QML)

        # Check if qml has root objects
        if not self.engine.rootObjects():
            sys.exit(-1)

        # Check if window closed and close all other processes.
        self.app.lastWindowClosed.connect(self.__app_closing)
        
        sys.exit(self.app.exec())
    
    def __app_closing(self):
        self.movie_list.stop_worker()

if __name__ == '__main__':
    TMDB()