import 'package:flutter/material.dart';
import 'package:mobflix/app/data/my_database.dart';
import 'package:mobflix/app/widgets/video_widget.dart';

class VideosComponent extends StatefulWidget {
  const VideosComponent({super.key});

  @override
  State<VideosComponent> createState() => _VideosComponentState();
}

class _VideosComponentState extends State<VideosComponent> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _videos = [];

  @override
  void initState() {
    super.initState();
    loadVideos();
  }

  @override
  void didUpdateWidget(covariant VideosComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadVideos(); // Recarrega os vídeos sempre que o widget for atualizado
  }

  Future<void> loadVideos() async {
    final video = await _dbHelper.getVideos();
    setState(() {
      _videos = video;
    });
  }

  Future<void> deleteVideo(int id) async {
    await _dbHelper.deleteVideo(id);
    loadVideos();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vídeo excluído com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final videos = _videos[index];

        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, size: 40, color: Colors.white),
          ),
          key: ValueKey(videos['id']),
          onDismissed: (DismissDirection direction) {
            deleteVideo(videos['id']);
          },
          confirmDismiss:
              (_) => showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text(
                      "Tem certeza que deseja excluir?",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: const Text(
                          'Não',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text(
                          'Sim',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              ),
          child: VideoWidget(
            categorie: videos['category'],
            thumbnail: videos['preview'],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: _videos.length,
    );
  }
}
