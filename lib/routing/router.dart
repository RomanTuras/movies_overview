import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_overview/data/repositories/auth/auth_repository.dart';
import 'package:movies_overview/presentation/home/home_page.dart';
import 'package:movies_overview/presentation/home/view_models/home_viewmodel.dart';
import 'package:movies_overview/presentation/movie/movie_page.dart';
import 'package:movies_overview/presentation/movie/view_models/movie_viewmodel.dart';
import 'routes.dart';
import 'package:provider/provider.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
      initialLocation: Routes.home,
      redirect: _redirect,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            path: Routes.home,
            builder: (context, state) {
              final viewModel = HomeViewmodel(
                movieRepository: context.read(),
              );
              return HomePage(viewmodel: viewModel);
            }),
        GoRoute(
            path: '/movie/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              final viewModel = MovieViewmodel(
                movieRepository: context.read(),
                id: id
              );
              return MoviePage(viewmodel: viewModel);
            })
      ],
    );

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;
  if (!loggedIn) {
    return Routes.login;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}
