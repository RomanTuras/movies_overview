import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_overview/routing/routes.dart';

/// Home button to navigate back to the '/' path.
class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    this.blur = false,
  });

  final bool blur;

  @override
  Widget build(BuildContext context) {
    final kBlurFilter = ImageFilter.blur(sigmaX: 2, sigmaY: 2);

    return SizedBox(
      height: 40.0,
      width: 40.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (blur)
            ClipRect(
              child: BackdropFilter(
                filter: kBlurFilter,
                child: const SizedBox(height: 40.0, width: 40.0),
              ),
            ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.deepOrangeAccent,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                context.go(Routes.home);
              },
              child: Center(
                child: Icon(
                  size: 24.0,
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
