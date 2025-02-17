import 'package:flutter/material.dart';
import 'package:movies_overview/presentation/movie/view_models/movie_viewmodel.dart';
import 'package:movies_overview/presentation/movie/widgets/movie_body.dart';
// import 'package:movies_overview/presentation/movie/widgets/movie_body.dart';

class MovieScreen extends StatefulWidget {
  final MovieViewmodel viewModel;

  const MovieScreen({super.key, required this.viewModel});

  @override
  State<MovieScreen> createState() => _MoviePageState();
}

class _MoviePageState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (BuildContext context, Widget? child) {
            if (widget.viewModel.load.running) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (widget.viewModel.load.error) {
              return Text('Failed!');
            }

            return child ?? Text('Null');
          },
          child: ListenableBuilder(
              listenable: widget.viewModel,
              builder: (context, child) {
                return Center(
                  child: MovieBody(
                    viewModel: widget.viewModel,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
