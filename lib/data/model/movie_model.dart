import 'package:movies_overview/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.adult,
    required super.title,
    required super.posterPath,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.voteCount,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      genreIds: List<int>.from(json['genre_ids']),
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'genre_ids': genreIds,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'release_date': releaseDate,
    };
  }
}
