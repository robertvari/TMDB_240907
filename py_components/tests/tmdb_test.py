import tmdbsimple as tmdb
import pprint
tmdb.API_KEY = "83cbec0139273280b9a3f8ebc9e35ca9"
tmdb.REQUESTS_TIMEOUT = 5

POSTER_TOOT = "https://image.tmdb.org/t/p/w300"

def get_popular_movies(page):
    movies = tmdb.Movies()
    popular_movies = movies.popular(page=page).get("results")

    for i in popular_movies:
        title = i.get("title")
        release_date = i.get("release_date")
        vote_average = int(round(i.get("vote_average") * 10))
        poster_path = f"{POSTER_TOOT}{i.get('poster_path')}"

        print(f"Title: {title} Release Date: {release_date}, Vote: {vote_average}, Poster: {poster_path}")

get_popular_movies(1)