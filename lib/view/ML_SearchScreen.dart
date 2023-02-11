import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/resources/app_color.dart';
import 'package:tflite/tflite.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
import '../main.dart';

class MLSearchScreen extends StatefulWidget {
  const MLSearchScreen({Key? key}) : super(key: key);

  @override
  State<MLSearchScreen> createState() => _MLSearchScreenState();
}

class _MLSearchScreenState extends State<MLSearchScreen> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController?.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCamera();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Text(
                  'Search With Your Camera',
                  style: GoogleFonts.dmSans(
                    fontSize: 20,
                    color: AppColor.primaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: screenHeight * 0.6,
                    width: screenWidth * 0.8,
                    child: !cameraController!.value.isInitialized
                        ? Container()
                        : AspectRatio(
                            aspectRatio: cameraController!.value.aspectRatio,
                            child: CameraPreview(cameraController!),
                          )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  output,
                  style: GoogleFonts.dmSans(
                    fontSize: 20,
                    color: AppColor.primaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
