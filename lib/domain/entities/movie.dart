class Movie {
  final int id;
  final bool adult;
  final String title;
  final String posterPath;
  final String overview;
  // final List<int> genres;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;

  Movie({
    required this.id,
    required this.adult,
    required this.title,
    required this.posterPath,
    required this.overview,
    // required this.genres,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
  });
}
