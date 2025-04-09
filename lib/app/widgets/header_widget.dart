import 'package:flutter/material.dart';
import 'package:mobflix/app/theme/light/light_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(height: 48, color: Color(0xFF1A1A1A)),
          Container(
            height: 38,
            width: double.infinity,
            color: LightColors.backgroundColor,
            child: Text(
              'MOBFLIX',
              style: TextStyle(color: LightColors.titleHomeBlue, fontSize: 32),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
