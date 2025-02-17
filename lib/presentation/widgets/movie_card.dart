import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_overview/config/constants.dart';
import 'package:movies_overview/domain/entities/movie.dart';
import '../../utils/image_error_listener.dart';
// import '../../core/ui/tag_chip.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  final Movie movie;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: pathToImg + movie.posterPath,
            fit: BoxFit.fitHeight,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            errorListener: imageErrorListener,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
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
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          // Handle taps
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final _cardTitleStyle = GoogleFonts.rubik(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 15.0,
    color: Colors.white,
    letterSpacing: 1,
    shadows: [
      // Helps to read the text a bit better
      Shadow(
        blurRadius: 3.0,
        color: Colors.black,
      )
    ],
  ),
);
