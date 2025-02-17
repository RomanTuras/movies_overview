class Movie {
  final int id;
  final bool adult;
  final String title;
  final String posterPath;
  final String overview;
  final List<Map<String, dynamic>>? genres;
  final List<int>? genreIds;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final List? originCountry;

  Movie({
    required this.id,
    required this.adult,
    required this.title,
    required this.posterPath,
    required this.overview,
    this.genres,
    this.genreIds,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    this.originCountry,
  });
}
