import tmdbsimple as tmdb
from datetime import datetime
tmdb.API_KEY = "83cbec0139273280b9a3f8ebc9e35ca9"
tmdb.REQUESTS_TIMEOUT = 5

POSTER_TOOT = "https://image.tmdb.org/t/p/w300"

def get_popular_movies(page):
    movies = tmdb.Movies()
    popular_movies = movies.popular(page=page).get("results")

    # Get genre list
    genre_list = tmdb.Genres().movie_list()["genres"]
    movie_genres = {}
    for i in genre_list:
        movie_genres[i.get("id")] = i.get("name")

    def get_genres(id_list):
        if not id_list:
            return []
        
        return [movie_genres[i] for i in id_list]

    movie_data_model = []
    for i in popular_movies:
        title = i.get("title")
        release_date = datetime.strptime(i.get("release_date"), "%Y-%m-%d")
        vote_average = int(round(i.get("vote_average") * 10))
        poster_path = f"{POSTER_TOOT}{i.get('poster_path')}"

        movie_data_model.append({
            "title": title,
            "display_date": release_date.strftime("%Y %B %d"),
            "sort_date": release_date,
            "vote_average": vote_average,
            "poster": poster_path,
            "genres": get_genres(i.get("genre_ids"))
        })

get_popular_movies(1)