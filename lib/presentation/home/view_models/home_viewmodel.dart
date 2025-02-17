import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:movies_overview/data/model/movie_model.dart';
import 'package:movies_overview/domain/repositories/movie_repository.dart';
import 'package:movies_overview/utils/command.dart';
import 'package:movies_overview/utils/result.dart';

class HomeViewmodel extends ChangeNotifier {
  final MovieRepository _movieRepository;
  late Command0 load;
  late Command1<void, String> search;

  HomeViewmodel({required MovieRepository movieRepository})
      : _movieRepository = movieRepository {
    load = Command0(_load)..execute();
    search = Command1<void, String>(_search);
  }

  final _log = Logger('HomeViewmodel');

  List<MovieModel> _movies = [];

  List<MovieModel> get movies => _movies;

  Future<Result> _load() async {
    try {
      final result = await _movieRepository.fetchMovies();
      switch (result) {
        case Ok<List<MovieModel>>():
          _movies = result.value;
          _log.fine('Loaded movies');
        case Error<List<MovieModel>>():
          _log.warning('Failed to load movies');
      }
      return result;
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _search(String query) async {
    try {
      final result = await _movieRepository.searchMovies(query);
      switch (result) {
        case Ok<List<MovieModel>>():
          _movies = result.value;
          _log.fine('Loaded searching movies ${_movies[0].title}');
        case Error<List<MovieModel>>():
          _log.warning('Failed to load searching movies');
      }
      return result;
    } finally {
      notifyListeners();
    }
  }
}
