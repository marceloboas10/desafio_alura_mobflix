import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.color,
    required this.categorie,
    this.width,
  });

  final Color color;
  final String categorie;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 116,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(categorie, style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
