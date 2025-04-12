import 'package:flutter/material.dart';
import 'package:mobflix/app/data/categories.dart';
import 'package:mobflix/app/data/my_database.dart';
import 'package:mobflix/app/theme/light/light_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? selectedCategory;
  TextEditingController url = TextEditingController();
  TextEditingController categorie = TextEditingController();
  bool previewIsDone = false;
  String? videoPreview;
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        title: Text(
          'Cadastre um vídeo',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: LightColors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 35),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('URL:', style: TextStyle(color: Colors.white)),
              Container(
                width: 318,
                height: 48,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF275FA3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: url,
                  onSubmitted: (value) {
                    var videoId = YoutubePlayer.convertUrlToId(url.text);
                    setState(() {
                      previewIsDone = true;
                      videoPreview = videoId!;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ex: N3dfsihguhu',
                    hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Text('Categoria:', style: TextStyle(color: Colors.white)),
              Container(
                width: 318,
                height: 48,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF275FA3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  underline: Text(''),
                  dropdownColor: Color(0xFF275FA3),
                  iconEnabledColor: Color(0xFFB0B0B0),
                  borderRadius: BorderRadius.circular(8),
                  value: selectedCategory,
                  isExpanded: true,
                  hint: Text(
                    'Selecione a categoria',
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  items:
                      categoriesColor.keys.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: categoriesColor[category],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                category,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      categorie.text = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 18),
              Text(
                'Preview',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
              SizedBox(height: 12),
              previewIsDone == false
                  ? Container(
                    width: 320,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset('assets/preview_video.png'),
                  )
                  : Container(
                    width: 320,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      fit: BoxFit.cover,
                      YoutubePlayer.getThumbnail(videoId: videoPreview!),
                    ),
                  ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xFF275FA3)),
                  fixedSize: WidgetStatePropertyAll(Size(318, 48)),
                  shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () async {
                  if (url.text.isNotEmpty && categorie.text.isNotEmpty) {
                    await dbHelper.insertVideo(
                      url.text,
                      categorie.text,
                      videoPreview!,
                    );
                    if (context.mounted) {
                      Navigator.pop(context, true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Vídeo cadastrado com sucesso!'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Preencha todos os campos!'),
                      ),
                    );
                  }
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
