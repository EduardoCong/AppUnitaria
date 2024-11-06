import 'package:appunificada/models/photos_model.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<Photo> photos;
  final Function(Photo) onTapPhoto;

  const CustomGridView({super.key, required this.photos, required this.onTapPhoto});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return GestureDetector(
          onTap: () => onTapPhoto(photo),
          child: GridTile(
            child: Image.network(photo.url, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
