import 'package:flutter/material.dart';
import 'package:mobflix/app/data/categories.dart';
import 'package:mobflix/app/widgets/categories_widget.dart';

class ListCategoriesComponents extends StatelessWidget {
  const ListCategoriesComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Row(
          spacing: 12,
          children:
              categoriesColor.entries.map((e) {
                return CategoriesWidget(color: e.value, categorie: e.key);
              }).toList(),
        ),
      ),
    );
  }
}
