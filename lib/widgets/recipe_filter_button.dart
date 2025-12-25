import 'package:flutter/material.dart';

class RecipeFilterButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const RecipeFilterButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange.shade700 : Colors.orange.shade100,
        borderRadius: BorderRadius.circular(12),
        border: isActive ? Border.all(color: Colors.orange, width: 2) : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: isActive ? Colors.white : Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            letterSpacing: 1.1,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.orange,
          ),
        ),
      ),
    );
  }
}
