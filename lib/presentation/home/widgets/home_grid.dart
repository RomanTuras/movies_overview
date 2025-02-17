import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_overview/presentation/home/view_models/home_viewmodel.dart';
import 'package:movies_overview/presentation/widgets/movie_card.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    super.key,
    required this.viewModel,
  });

  final HomeViewmodel viewModel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 30 / 46,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final movie = viewModel.movies[index];
          return MovieCard(
            key: ValueKey(movie.posterPath),
            movie: movie,
            onTap: () {
              context.go('/movie/${viewModel.movies[index].id}');
            },
          );
        },
        childCount: viewModel.movies.length,
      ),
    );
  }
}
