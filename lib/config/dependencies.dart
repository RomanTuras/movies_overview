import 'package:movies_overview/data/repositories/auth/auth_repository.dart';
import 'package:movies_overview/data/repositories/auth/auth_repository_dev.dart';
import 'package:movies_overview/data/repositories/movie/movie_repository_impl.dart';
import 'package:movies_overview/data/services/movie_api_service.dart';
import 'package:movies_overview/domain/repositories/movie_repository.dart';
import 'package:movies_overview/domain/use_cases/movies_create_uscase.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> _sharedProviders = [
  Provider(
    lazy: true,
    create: (context) => MoviesCreateUscase(
      repository: context.read(),
    ),
  )
];

List<SingleChildWidget> get providersRemote {
  return [
    Provider(
      create: (context) => MovieApiService(),
    ),
    Provider(
      create: (context) => MovieRepositoryImpl(
        apiService: context.read(),
      ) as MovieRepository,
    ),
    ChangeNotifierProvider.value(
      value: AuthRepositoryDev() as AuthRepository,
    ),
    ..._sharedProviders,
  ];
}
