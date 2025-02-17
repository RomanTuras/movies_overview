import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_overview/presentation/home/view_models/home_viewmodel.dart';
import 'package:movies_overview/presentation/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewmodel});

  final HomeViewmodel viewmodel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, child) {
            if (widget.viewmodel.load.running) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (widget.viewmodel.load.error) {
              return Text('Failed!');
            }

            return child ?? Text('Null');
          },
          child: ListenableBuilder(
              listenable: widget.viewmodel,
              builder: (context, child) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: CustomScrollView(
                    slivers: [
                      _Grid(viewModel: widget.viewmodel),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class _Grid extends StatelessWidget {
  const _Grid({
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
