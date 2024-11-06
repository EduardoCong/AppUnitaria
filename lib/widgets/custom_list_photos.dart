import 'package:appunificada/models/photos_model.dart';
import 'package:appunificada/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class PhotoGrid extends StatelessWidget {
  final List<Photo> photos;
  final Function(Photo) onTapPhoto;

  const PhotoGrid({
    super.key,
    required this.photos,
    required this.onTapPhoto
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return PhotoCard(
          photo: photo,
          onTap: () => onTapPhoto(photo),
        );
      },
    );
  }
}
