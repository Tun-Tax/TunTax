import 'package:flutter/material.dart';

class BackgroundAlt extends StatelessWidget {
  final Widget child;

  const BackgroundAlt({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/ellipse-blue-alt.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/ellipse-purple-alt.png',
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}