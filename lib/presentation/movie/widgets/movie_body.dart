import 'package:flutter/material.dart';
import 'package:movies_overview/presentation/movie/view_models/movie_viewmodel.dart';
import 'package:movies_overview/presentation/movie/widgets/movie_header.dart';

class MovieBody extends StatelessWidget {
  final MovieViewmodel viewModel;

  const MovieBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final movie = viewModel.movie;
        return CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: MovieHeader(movie: movie),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 0,
                  bottom: 25.0,
                ),
                child: Text(
                  movie.overview,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
