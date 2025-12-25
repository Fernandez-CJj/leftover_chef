import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({super.key, required this.ingredient});

  final dynamic ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.circle, size: 14, color: Colors.orange),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              ingredient,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                letterSpacing: 0.2,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
