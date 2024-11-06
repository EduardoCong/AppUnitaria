import 'package:flutter/material.dart';

class PercentageWidget extends StatelessWidget {
  final double percentage;
  final VoidCallback onTap;
  final bool isSelected;

  const PercentageWidget({
    super.key,
    required this.percentage,
    required this.onTap, 
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 2),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 102, 87, 121),
              Color(0xffC012FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Text(
          '$percentage%',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}