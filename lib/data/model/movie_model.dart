import 'package:movies_overview/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.adult,
    required super.title,
    required super.posterPath,
    required super.overview,
    // required super.genres,
    required super.voteAverage,
    required super.voteCount,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      adult: json['adult'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      // genres: List<int>.from(json['genres']),
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      releaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      // 'genres': genres,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'release_date': releaseDate,
    };
  }
}

// {adult: false, backdrop_path: /1YL8ksfwm3p2Tgt1yaNVYYOvOKC.jpg, belongs_to_collection: null,
// budget: 0,
// genres: [{id: 16, name: Animation}, {id: 14, name: Fantasy}, {id: 28, name: Action}],
// homepage: https://www.netflix.com/title/81484026,
// id: 1203329, imdb_id: tt15495150, origin_country: [US], original_language: en,
// original_title: The Witcher: Sirens of the Deep,
// overview: Geralt of Rivia, a mutated monster hunter, is hired to investigate a series of attacks in a seaside village and finds himself drawn into a centuries-old conflict between humans and merpeople. He must count on friends — old and new — to solve the mystery before the hostilities between the two kingdoms escalate into an all-out war.,
// popularity: 113.175,
// poster_path: /mfy5SyaNBleBACs5mIVudDP7UNY.jpg,
// production_companies: [{id: 58209, logo_path: /bmoAT1OD8AAHpBVj4OGvA5UkM9e.png, name: Studio Mir, origin_country: KR}, {id: 124634, logo_path: /psPuEpFeqqykCaNecpCq7K8Qsro.png, name: Hivemind, origin_country: US}, {id: 137769, logo_path: /xNtW64uEpnium6eitLnyNl8za27.png, name: Platige Films, origin_country: PL}, {id: 162859, logo_path: null, name: Little Schmidt Productions, origin_country: US}],
// production_countries: [{iso_3166_1: PL, name: Poland}, {iso_3166_1: KR, name: South Korea}, {iso_3166_1: US, name: United States of America}],
// release_date: 2025-02-10,
// revenue: 0, runtime: 92,
// spoken_languages: [{english_name: English, iso_639_1: en, name: English}],
// status: Released, tagline: ,
// title: The Witcher: Sirens of the Deep,
// video: false,
// vote_average: 7.414,
// vote_count: 29}