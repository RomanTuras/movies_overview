import 'package:movies_overview/data/model/movie_model.dart';
import 'package:movies_overview/utils/result.dart';

abstract class MovieRepository {

  /// Returns the list of [MovieModel]
  Future<Result<List<MovieModel>>> fetchMovies();

  /// Returns a full [MovieModel] given the id.
  Future<Result<MovieModel>> fetchMovie(int id);
}
