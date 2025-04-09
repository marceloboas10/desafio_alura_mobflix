import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/Banner.png'),
        Positioned(
          bottom: 20,
          left: 129,
          child: Container(
            height: 42,
            width: 128,
            decoration: BoxDecoration(
              color: Color(0xFF2478DF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Assista Agora',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
