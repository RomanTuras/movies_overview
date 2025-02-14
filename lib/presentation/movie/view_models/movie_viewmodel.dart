import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:movies_overview/data/model/movie_model.dart';
import 'package:movies_overview/domain/repositories/movie_repository.dart';
import 'package:movies_overview/utils/command.dart';
import 'package:movies_overview/utils/result.dart';

class MovieViewmodel extends ChangeNotifier {
  final MovieRepository _movieRepository;
  final int _id;
  late Command0 load;

  MovieViewmodel({required MovieRepository movieRepository, required int id})
      : _movieRepository = movieRepository, _id = id {
    load = Command0(_load)..execute();
  }

  final _log = Logger('MovieViewmodel');

  late MovieModel _movie;

  MovieModel get movie => _movie;

  Future<Result> _load() async {
    try {
      final result = await _movieRepository.fetchMovie(_id);
      switch (result) {
        case Ok<MovieModel>():
          _movie = result.value;
          _log.fine('Loaded movie!');
        case Error<MovieModel>():
          _log.warning('Failed to load movie!');
      }
      return result;
    } finally {
      notifyListeners();
    }
  }
}