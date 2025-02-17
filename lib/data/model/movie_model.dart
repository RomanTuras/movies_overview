import 'package:movies_overview/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.adult,
    required super.title,
    required super.posterPath,
    required super.overview,
    super.genres,
    super.genreIds,
    required super.voteAverage,
    required super.voteCount,
    required super.releaseDate,
    super.originCountry,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      adult: json['adult'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      genres: json['genres'] != null
          ? List<Map<String, dynamic>>.from(json['genres'])
          : [],
      genreIds:
          json['genreIds'] != null ? List<int>.from(json['genreIds']) : [],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
      originCountry: json['origin_country'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'genres': genres,
      'genre_ids': genreIds,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'release_date': releaseDate,
      'origin_country': originCountry,
    };
  }
}
