import 'package:logging/logging.dart';
import 'package:movies_overview/data/model/movie_model.dart';
import 'package:movies_overview/domain/repositories/movie_repository.dart';
import 'package:movies_overview/utils/result.dart';

class MoviesCreateUscase {
  MoviesCreateUscase({required MovieRepository repository})
      : _repository = repository;

  final MovieRepository _repository;
  final _log = Logger('MoviesCreateUseCase');

  Future<Result<List<MovieModel>>> call() async {
    final result = await _repository.fetchMovies();

    switch (result) {
      case Ok<List<MovieModel>>():
        final movies = result.value;
        _log.fine('Movies loaded: ${result.value}');
        return Result.ok(movies);
      case Error<List<MovieModel>>():
        _log.warning('Error when movie loading: ${result.error}');
        return Result.error(result.error);
    }
  }
}
