import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:movies_overview/config/constants.dart';
import 'package:movies_overview/data/model/movie_model.dart';
import 'package:movies_overview/utils/result.dart';

class MovieApiService {
  final Map<String, String>? _headers;

  MovieApiService({Map<String, String>? headers})
      : _headers = headers ??
            {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            };

  final _log = Logger('MovieApiService');

  Future<Result<List<MovieModel>>> fetchMovies() async {
    try {
      final response = await http.get(
          Uri.parse(
              '$moviesAPIBaseURL/trending/movie/day?language=$language&include_adult=$adult&page=1'),
          headers: _headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        // _log.info(data);
        return Result.ok(data['results']
            .map<MovieModel>((json) => MovieModel.fromJson(json))
            .toList());
      } else {
        return Result.error(HttpException('Invalid response'));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<MovieModel>> fetchMovie(int id) async {
    try {
      final response = await http.get(
          Uri.parse('$moviesAPIBaseURL/movie/$id?language=$language'),
          headers: _headers);

      if (response.statusCode == 200) {
        // _log.info(json.decode(response.body));
        // final <String, dynamic> data = json.decode(response.body);
        return Result.ok(MovieModel.fromJson(json.decode(response.body)));
      } else {
        _log.warning('Invalid response');
        return Result.error(HttpException('Invalid response'));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
