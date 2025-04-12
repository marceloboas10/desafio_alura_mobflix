import 'package:flutter/material.dart';
import 'package:mobflix/app/components/list_categories_components.dart';
import 'package:mobflix/app/components/videos_component.dart';
import 'package:mobflix/app/pages/register_page.dart';
import 'package:mobflix/app/widgets/banner_widget.dart';
import 'package:mobflix/app/widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          );
          if (result == true) {
            setState(() {});
          }
        },
        backgroundColor: Color(0xFF7B61FF),
        child: Icon(Icons.add, color: Colors.white, size: 36),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(),
            SizedBox(height: 5),
            BannerWidget(),
            SizedBox(height: 10),
            ListCategoriesComponents(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 16,
                  right: 16,
                  bottom: 8,
                ),
                child: VideosComponent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
