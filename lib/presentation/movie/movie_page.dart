import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_overview/presentation/movie/view_models/movie_viewmodel.dart';

class MoviePage extends StatefulWidget {
  final MovieViewmodel viewmodel;

  const MoviePage({super.key, required this.viewmodel});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                return Center(child: Text('movie ${widget.viewmodel.movie.title}'),);
              }),
        ),
      ),
    );
  }
}
