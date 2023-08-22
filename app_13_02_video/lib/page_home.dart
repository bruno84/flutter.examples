import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
     // Verifico de devo dar refresh e play
     if (_controller.value.isInitialized)
     {
       print("Bruno: Iniciado!");

       // Exibe player
       return AspectRatio(
         aspectRatio: _controller.value.aspectRatio,
         child: VideoPlayer(_controller),
       );
     }
     else
     {
       print("Bruno: Nao Iniciado!");

       // Entao manda iniciar!
       _controller.initialize().then((_) {
         setState(() {
           print("Bruno: Iniciado finalmente!");
           _controller.play();
         });
       });

       // Exibe tela azul
       return Container(
         color: Colors.blue,
         height: 300,
       );
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
    XFile? xf = await imagePicker.pickVideo(
        source: ImageSource.camera,
        maxDuration: Duration(seconds: 3),
        preferredCameraDevice: CameraDevice.front
    );

    setState(() {
      videoUri = Uri.file(xf!.path);
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