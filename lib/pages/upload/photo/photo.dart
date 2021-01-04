import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// import 'package:path/path.dart';
// import 'package:image/image.dart' as imageLib;
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:photofilters/photofilters.dart';

class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  CameraController controller;
  Future<void> _initializeControllerFuture;

  String fileName;
  File imageFile;
  List<Filter> filters = presetFiltersList;

  var cameras;

  // Future initCamera() async {
  //   cameras = await availableCameras(); //获取相机列表
  //   controller = CameraController(cameras[0], ResolutionPreset.medium);
  //   _initializeControllerFuture = controller.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {});
  //   });
  // }

  //打开本地相册，选取图片
  Future getGalleryImage(context) async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    print(pickedFile);

    print(imageFile);
    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  //拍照
  Future startCameraPhoto() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    print(pickedFile.path);
    setState(() {
      imageFile = File(pickedFile.path);
    });
  }

  @override
  void initState() {
    print(presetFiltersList);
    super.initState();
    startCameraPhoto();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _isInitialized = controller?.value?.isInitialized;
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: imageFile != null
                  ? Image.file(
                      imageFile,
                      width: size.width,
                      height: size.height,
                      fit: BoxFit.cover,
                    )
                  : _isInitialized != null
                      ? Transform.scale(
                          scale: controller.value.aspectRatio / deviceRatio,
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: CameraPreview(controller),
                            ),
                          ),
                        )
                      : SizedBox(),
            ),
            Positioned(
              top: 30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_left,
                        size: 30, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Photo",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
            Positioned(
              top: 65,
              right: 20,
              height: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      'lib/assets/images/Switch Camera Icon.png',
                      width: 17,
                      height: 20,
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'lib/assets/images/Flash Off Icon.png',
                      width: 17,
                      height: 20,
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'lib/assets/images/Timer Icon.png',
                      width: 17,
                      height: 20,
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'lib/assets/images/Filters Icon.png',
                      width: 24,
                      height: 20,
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 27.0, height: 32.0),
                  SizedBox(width: 27.0, height: 32.0),
                  // GestureDetector(
                  //   onTap: () => getCameraPhoto(),
                  //   child: Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       Container(
                  //         width: 95.0,
                  //         height: 95.0,
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           border: Border.all(
                  //             width: 4.0,
                  //             color: Color.fromRGBO(41, 169, 224, 1),
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 80.0,
                  //         height: 80.0,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           shape: BoxShape.circle,
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 50.0,
                  //         height: 55.0,
                  //         decoration: BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //                 color: Color.fromRGBO(0, 0, 0, 0.2),
                  //                 offset: Offset(0, 4.0),
                  //                 blurRadius: 10.0)
                  //           ],
                  //           image: DecorationImage(
                  //             image: AssetImage(
                  //               'lib/assets/images/Photo Upload Icon.png',
                  //             ),
                  //             fit: BoxFit.contain,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () => getGalleryImage(context),
                    child: Image.asset('lib/assets/images/Upload Post Icon.png',
                        width: 27.0, height: 32.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
