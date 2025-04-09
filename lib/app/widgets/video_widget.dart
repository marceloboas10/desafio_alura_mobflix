import 'package:flutter/material.dart';
import 'package:mobflix/app/theme/light/light_colors.dart';
import 'package:mobflix/app/widgets/categories_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
    required this.categorie,
    required this.thumbnail,
  });

  final String categorie;
  final String thumbnail;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesWidget(
          color: LightColors.mobile,
          categorie: widget.categorie,
          width: 94,
        ),
        SizedBox(height: 12),
        Container(
          width: 320,
          height: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.network(
            YoutubePlayer.getThumbnail(videoId: widget.thumbnail),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
