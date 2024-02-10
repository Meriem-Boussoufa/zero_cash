import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class SuccessFailure extends StatefulWidget {
  const SuccessFailure({super.key});

  @override
  State<SuccessFailure> createState() => _SuccessFailureState();
}

class _SuccessFailureState extends State<SuccessFailure> {
  late bool verifyFace;
  late int numberFaces;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    Future<String> _detectFaces() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      // Simulate a long-running operation
      final imageData = pickedFile!.path;
      final inputImage = InputImage.fromFilePath(imageData);
      final faceDetector = GoogleMlKit.vision.faceDetector();
      final faces = await faceDetector.processImage(inputImage);
      verifyFace = faces.isNotEmpty;
      numberFaces = faces.length;
      return '';
    }

    return SafeArea(
        child: Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      var buttonStyle = ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
            Size(constraint.maxWidth * 0.5, constraint.maxHeight * 0.07)),
      );

      return FutureBuilder<String>(
          future: _detectFaces(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else {
              if (!snapshot.hasError) {
                return Center(
                    child: verifyFace && numberFaces == 1
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 40, 20, 10),
                                child: Text(
                                  'Success !',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Your face ID scan has been successful and approved.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                              Container(
                                margin: const EdgeInsets.all(40),
                                child: Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: Theme.of(context).primaryColor,
                                  size: 200,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/scanncard');
                                  },
                                  style: buttonStyle,
                                  child: const Text('Next')),
                              const SizedBox(
                                height: 20,
                              ),
                              OutlinedButton(
                                  onPressed: () {},
                                  style: buttonStyle,
                                  child: const Text('Skip')),
                            ],
                          )
                        : Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
                                child: Text(
                                  'Failure',
                                  style: TextStyle(
                                      color: Color.fromRGBO(176, 0, 32, 1),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Your face ID scan has been failed.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                              Container(
                                margin: const EdgeInsets.all(40),
                                child: const Icon(
                                  Icons.close_rounded,
                                  color: Color.fromRGBO(176, 0, 32, 1),
                                  size: 200,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    //Navigator.pushNamed(context, '/confirmcode');
                                  },
                                  style: buttonStyle,
                                  child: const Text('Next')),
                              const SizedBox(
                                height: 20,
                              ),
                              OutlinedButton(
                                  onPressed: () {},
                                  style: buttonStyle,
                                  child: const Text('Skip')),
                            ],
                          ));
              } else {
                return Text("Error: ${snapshot.error}");
              }
            }
          });
    })));
  }
}
