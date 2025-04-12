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
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.thumbnail,
      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        bottomActions: [
          CurrentPosition(controller: _controller),
          ProgressBar(
            isExpanded: true,
            colors: ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.red,
            ),
          ),
        ],
      ),
      builder: (context, player) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoriesWidget(
              color: LightColors.mobile,
              categorie: widget.categorie,
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: player,
            ),
          ],
        );
      },
    );
  }
}
