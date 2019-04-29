import 'package:custom_chewie/custom_chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoPreviewState();
  }
}

class VideoPreviewState extends State<VideoPreview> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Video Preview"),
      ),
      body: new Center(
          child: new Column(children: [
        new Container(
            child: new Chewie(
          new VideoPlayerController.asset(
              "assets/video/big_buck_bunny_720p_20mb.mp4"),
          aspectRatio: 3 / 2,
          autoPlay: true,
          looping: true,
        )),
        new Container(
          child: new Image.asset('assets/images/header-illustration.png'),
        )
      ])),
    );
  }
}
