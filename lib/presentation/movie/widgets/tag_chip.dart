// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.tag,
    this.fontSize = 10,
    this.height = 20,
    this.chipColor,
    this.onChipColor,
  });

  final String tag;

  final double fontSize;
  final double height;
  final Color? chipColor;
  final Color? onChipColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _iconFrom(tag),
                    color: Colors.grey,
                    size: fontSize,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    tag,
                    textAlign: TextAlign.center,
                    style: _textStyle(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData? _iconFrom(String tag) {
    return switch (tag) {
      'Thriller' => Icons.kayaking_outlined,
      'Family' => Icons.beach_access_outlined,
      'City' => Icons.location_city_outlined,
      'Science Fiction' => Icons.museum_outlined,
      'Horror' => Icons.restaurant,
      'Drama' => Icons.hiking,
      'Historic' => Icons.menu_book_outlined,
      'Luxury' => Icons.attach_money_outlined,
      'Mountain' => Icons.landscape_outlined,
      'Comedy' => Icons.local_bar_outlined,
      'Romance' => Icons.favorite_border_outlined,
      'Adventure' => Icons.agriculture_outlined,
      'Crime' => Icons.church_outlined,
      'Animation' => Icons.attractions_outlined,
      'Action' => Icons.downhill_skiing_outlined,
      'Wine' => Icons.wine_bar_outlined,
      'Fantasy' => Icons.adb_outlined,
      _ => Icons.label_outlined,
    };
  }

  TextStyle _textStyle(BuildContext context) => GoogleFonts.openSans(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
          color: Colors.grey[800],
          textBaseline: TextBaseline.alphabetic,
        ),
      );
}
