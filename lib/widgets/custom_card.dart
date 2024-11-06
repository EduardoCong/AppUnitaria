import 'package:appunificada/models/photos_model.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;
  final VoidCallback onTap;

  const PhotoCard({
    super.key, 
    required this.photo,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(photo.description, style: const TextStyle(fontSize: 14)),
        ),
        child: Image.network(photo.url, fit: BoxFit.cover),
      ),
    );
  }
}
