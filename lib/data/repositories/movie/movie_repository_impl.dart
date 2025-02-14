import 'package:movies_overview/data/model/movie_model.dart';
import 'package:movies_overview/data/services/movie_api_service.dart';
import 'package:movies_overview/domain/repositories/movie_repository.dart';
import 'package:movies_overview/utils/result.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({required MovieApiService apiService})
      : _apiService = apiService;

  final MovieApiService _apiService;
  List<MovieModel>? _cachedData;

  @override
  Future<Result<List<MovieModel>>> fetchMovies() async {
    if (_cachedData == null) {
      final result = await _apiService.fetchMovies();
      if (result is Ok<List<MovieModel>>) {
        _cachedData = result.value;
      }
      return result;
    } else {
      return Result.ok(_cachedData!);
    }
  }

  @override
  Future<Result<MovieModel>> fetchMovie(int id) async {
    // if (_cachedData == null) {
      final result = await _apiService.fetchMovie(id);
      // if (result is Ok<MovieModel>) {
        // _cachedData = result.value;
      // }
      return result;
    // } else {
    //   return Result.ok(_cachedData!);
    // }
  }
}
