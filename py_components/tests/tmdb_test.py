import tmdbsimple as tmdb
import pprint
tmdb.API_KEY = "83cbec0139273280b9a3f8ebc9e35ca9"
tmdb.REQUESTS_TIMEOUT = 5

movie = tmdb.Movies(603)
response = movie.info()
pprint.pprint(response)