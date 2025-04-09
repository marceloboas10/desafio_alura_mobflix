import 'package:flutter/material.dart';
import 'package:mobflix/app/theme/light/light_colors.dart';
import 'package:mobflix/app/widgets/categories_widget.dart';

class ListCategoriesComponents extends StatelessWidget {
  const ListCategoriesComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 35, right: 20),
        child: Row(
          children: [
            CategoriesWidget(
              color: LightColors.frontEnd,
              categorie: 'Front End',
            ),
            SizedBox(width: 12),
            CategoriesWidget(
              color: LightColors.programacao,
              categorie: 'Programação',
            ),
            SizedBox(width: 12),
            CategoriesWidget(color: LightColors.mobile, categorie: 'Mobile'),
            SizedBox(width: 12),
            CategoriesWidget(
              color: LightColors.dataSciense,
              categorie: 'Data Sciense',
            ),
            SizedBox(width: 12),
            CategoriesWidget(color: LightColors.devopos, categorie: 'Devops'),
            SizedBox(width: 12),
            CategoriesWidget(
              color: LightColors.uxDesign,
              categorie: 'UX e Design',
            ),
          ],
        ),
      ),
    );
  }
}
