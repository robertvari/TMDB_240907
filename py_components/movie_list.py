from PySide6.QtCore import QAbstractListModel, QModelIndex, Qt


class MovieList(QAbstractListModel):
    DataRole = Qt.UserRole

    def __init__(self):
        super().__init__()
        self.__movies = []
        
    def rowCount(self, parent=QModelIndex):
        return len(self.__movies)

    def roleNames(self):
        return {MovieList.DataRole: b"movie"}
    
    def data(self, index, role=Qt.DisplayRole):
        row = index.row()
        if role == MovieList.DataRole:
            return self.__movies[row]