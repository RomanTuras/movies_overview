class Movie {
  final bool adult;
  final String title;
  final String posterPath;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;

  Movie({
    required this.adult,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
  });
}
