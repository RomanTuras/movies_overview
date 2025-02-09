import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies_overview/config/constants.dart';
import 'package:movies_overview/data/model/movie_model.dart';
import 'package:movies_overview/utils/result.dart';

class MovieApiService {
  Future<Result<List<MovieModel>>> fetchMovies() async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(
          Uri.parse(
              '$moviesAPIBaseURL/trending/movie/day?language=$language&include_adult=$adult&page=1'),
          headers: headers);

      if (response.statusCode == 200) {
        // print(response.body);
        final Map<String, dynamic> data = json.decode(response.body);
        // final List<dynamic> data = json.decode(response.body);
        // return data.map((json) => UserModel.fromJson(json)).toList();
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
}
