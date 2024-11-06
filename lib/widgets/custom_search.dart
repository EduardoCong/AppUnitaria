import 'package:appunificada/blocs/unplash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final ValueChanged<String> onChanged;

  SearchInput({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        labelText: 'Buscar fotos...',
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            if (controller.text.isNotEmpty) {
              context.read<PhotoBloc>().add(SearchPhotosEvent(controller.text));
            }
          },
        ),
      ),
    );
  }
}
