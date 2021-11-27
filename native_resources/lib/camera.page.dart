import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:native_resources/display_picture.page.dart';

class CameraPage extends StatefulWidget {
  static String route = 'camera_page';

  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _initCameras();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  _initCameras() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras.first, ResolutionPreset.max);

    await _controller.initialize();

    if (!mounted) {
      return;
    }

    setState(() {});

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _controller.value.isInitialized
            ? CameraPreview(_controller)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPicture(path: image.path),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
