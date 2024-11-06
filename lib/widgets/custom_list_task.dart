import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final ValueChanged<bool?> onCheckboxChanged;
  final VoidCallback onLongPress;

  const ListItem({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onCheckboxChanged,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isCompleted,
        onChanged: onCheckboxChanged,
      ),
      onLongPress: onLongPress,
    );
  }
}
