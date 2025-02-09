import 'package:movies_overview/data/model/movie_model.dart';
import 'package:movies_overview/utils/result.dart';

abstract class MovieRepository {
  Future<Result<List<MovieModel>>> fetchMovies();
}
