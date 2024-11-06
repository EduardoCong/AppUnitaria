import 'package:appunificada/blocs/unplash_bloc.dart';
import 'package:appunificada/screens/listImages/photo_details_screen.dart';
import 'package:appunificada/services/photos_services.dart';
import 'package:appunificada/widgets/custom_header.dart';
import 'package:appunificada/widgets/custom_photo_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appunificada/widgets/custom_loading.dart';
import 'package:appunificada/widgets/custom_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final photoService = PhotoService();

    return BlocProvider(
      create: (_) => PhotoBloc(photoService),
      child: const Scaffold(
        body: Stack(
          children: [
            HeadersTriangulo(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: _StructureList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _StructureList extends StatelessWidget {
  const _StructureList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 150),
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SearchInput(
            onChanged: (value) {
              context.read<PhotoBloc>().add(SearchPhotosEvent(value));
            },
          ),
        ),
        const SizedBox(height: 10),
        const _BlocList(),
      ],
    );
  }
}

class _BlocList extends StatelessWidget {
  const _BlocList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        if (state is PhotoLoading) {
          return const LoadingIndicator();
        } else if (state is PhotoLoaded) {
          return Flexible(
            child: CustomGridView(
              photos: state.photos,
              onTapPhoto: (photo) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PhotoDetailScreen(photo: photo),
                  ),
                );
              },
            ),
          );
        } else if (state is PhotoError) {
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}