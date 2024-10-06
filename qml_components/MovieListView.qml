import QtQuick
import "custom_components"

Item{
    GridView{
        id: grid_view
        anchors.fill: parent
        model: MovieListProxy
        cellWidth: 184
        cellHeight: 386
        clip: true

        delegate: MovieCard{
            width: grid_view.cellWidth - 10
            height: grid_view.cellHeight - 10
            title: movie.title
            release_date: movie.display_date
            popularity: movie.vote_average
            poster: movie.poster_path
            movie_id: movie.id
        }
    }
}