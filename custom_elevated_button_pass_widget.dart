import 'package:flutter/material.dart';

class CustomElevatedButtonPassWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final int point;

  const CustomElevatedButtonPassWidget({
    super.key,
    required this.onPressed,
    required this.point,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Add $point ${point == 1 ? 'Point' : 'Points'}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}