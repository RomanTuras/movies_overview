import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_overview/config/constants.dart';
import 'package:movies_overview/domain/entities/movie.dart';
import 'package:movies_overview/presentation/movie/widgets/tag_chip.dart';
import 'package:movies_overview/presentation/widgets/home_button.dart';
import 'package:movies_overview/utils/image_error_listener.dart';

class MovieHeader extends StatelessWidget {
  final Movie movie;
  const MovieHeader({super.key, required this.movie});

  String getDate(String date) {
    final date = DateTime.parse(movie.releaseDate);
    return date.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Top(movie: movie),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Text(
            movie.title,
            style: const TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 0,
            bottom: 10.0,
          ),
          child: Row(
            children: [
              Icon(
                Icons.star,
                size: 20.0,
                color: Colors.deepOrange,
              ),
              SizedBox(width: 5.0),
              Text(
                movie.voteAverage.toStringAsFixed(1),
              ),
            ],
          ),
        ),
        if (movie.genres != null)
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _Tags(genres: movie.genres!),
            ],
          ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 15.0,
            bottom: 0,
          ),
          child: _InfoRow(
              title: 'Release year:', content: getDate(movie.releaseDate)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          child: _InfoRow(
              title: 'Country:', content: movie.originCountry?[0] ?? '-'),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final String content;
  const _InfoRow({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey[700]),
          textAlign: TextAlign.right,
        ),
        const SizedBox(width: 5.0),
        Text(
          content,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _HeaderImage(movie: movie),
          Positioned(
            right: 20.0,
            top: 10.0,
            child: const SafeArea(
              top: true,
              child: HomeButton(blur: true),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({
    required this.genres,
  });

  final List<Map<String, dynamic>> genres;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final chipColor = switch (brightness) {
      Brightness.dark => Colors.white,
      Brightness.light => Colors.grey,
    };
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: genres
            .map((genre) => TagChip(
                  tag: genre['name'],
                  fontSize: 16,
                  height: 32,
                  chipColor: chipColor,
                  onChipColor: Theme.of(context).colorScheme.onSurface,
                ))
            .toList(),
      ),
    );
  }
}

class TitleGradient extends StatelessWidget {
  final String title;
  final String? subtitle;

  const TitleGradient({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withAlpha(255),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(subtitle ?? '')
          ],
        ),
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fitWidth,
      imageUrl: pathToImg + movie.posterPath,
      errorListener: imageErrorListener,
    );
  }
}
