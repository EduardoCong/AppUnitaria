import 'package:flutter/material.dart';

class TextInputDialog extends StatelessWidget {
  final String title;
  final String hintText;
  final String confirmButtonText;
  final ValueChanged<String> onConfirm;

  const TextInputDialog({
    super.key,
    required this.title,
    required this.hintText,
    required this.confirmButtonText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final input = controller.text.trim();
            if (input.isNotEmpty) {
              onConfirm(input);
            }
            Navigator.of(context).pop();
          },
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
