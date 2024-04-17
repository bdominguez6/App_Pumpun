import 'package:flutter/material.dart';

/// Un [Container] con una imagen formateada.
///
/// Genera un [Container] con ancho [width] y alto [height] que contiene
/// una imagen [imagePath] con formato circular y reborde blanco.
class CircularImage extends StatelessWidget {

  const CircularImage(
      {super.key,
      required this.width,
      required this.height,
      required this.imagePath});

  final double width;
  final double height;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: width * 0.01,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
