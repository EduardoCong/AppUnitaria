import 'package:appunificada/blocs/unplash_bloc.dart';
import 'package:appunificada/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final query = context.read<SearchInput>().controller.text;
        if (query.isNotEmpty) {
          context.read<PhotoBloc>().add(SearchPhotosEvent(query));
        }
      },
      child: const Text('Buscar'),
    );
  }
}
