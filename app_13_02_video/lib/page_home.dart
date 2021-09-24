import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import 'comp/comp_elevatedbutton.dart';


class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  late VideoPlayerController _controller;
  ImagePicker imagePicker = ImagePicker();
  var videoUri;

  @override
  void initState()
  {
    super.initState();

    _controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    _controller.setLooping(true);
    _controller.initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 13-02 - video"),
        centerTitle: true,
      ),
      body: _body(),
      floatingActionButton: _floatPlayPause(),
    );
  }

  Container _body() {
    return Container(
        color: Colors.white,
      child: ListView(
        children: [
          SizedBox(height: 20),
          CompElevatedButton("Camera - Video", _onClickCameraVideo, height: 30, fontSize: 20, colorBG: Colors.blue),
          SizedBox(height: 10),
          CompElevatedButton("Galeria - Video", _onClickGaleriaVideo, height: 30, fontSize: 20, colorBG: Colors.blue),
          SizedBox(height: 10),
          _video(),
          SizedBox(height: 20),
        ]
      )
    );
  }

  _video()
  {
    if (videoUri == null)
    {
      print("Video default");
      if (_controller.value.isInitialized)
      {
        return AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        );
      }
      else {
        return Container();
      }
    }
    else
    {
      print("Video carregado");
      print("videoUri = " + videoUri.toString());

      _controller.initialize().then((_) {
        setState(() {
          print("PLAY!");
          _controller.play();
        });
      });

      if (_controller.value.isInitialized)
      {
        print("Video inicializado");
        return AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        );
      }
      else {
        print("Video NAO inicializado");
        return Container(
          color: Colors.orange,
          height: 300,
        );
      }
    }
  }

  _floatPlayPause()
  {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
        });
      },
      child: Icon(
        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    );
  }


  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  void _onClickCameraVideo() async
  {
    XFile? f = await imagePicker.pickVideo(
        source: ImageSource.camera,
        maxDuration: Duration(seconds: 5),
        preferredCameraDevice: CameraDevice.front
    );

    setState(() {
      videoUri = Uri.file(f!.path);
      _controller = VideoPlayerController.contentUri(videoUri);
    });
  }

  void _onClickGaleriaVideo() async
  {
    XFile? f = await imagePicker.pickVideo(source: ImageSource.gallery);

    setState(() {
      videoUri = Uri.file(f!.path);
      _controller = VideoPlayerController.contentUri(videoUri);
    });
  }



}