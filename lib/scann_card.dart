import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannCard extends StatefulWidget {
  const ScannCard({super.key});

  @override
  State<ScannCard> createState() => _ScannCardState();
}

class _ScannCardState extends State<ScannCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: LayoutBuilder(builder: (context, constraint) {
        var buttonStyle = ButtonStyle(
            minimumSize: MaterialStatePropertyAll(
                Size(constraint.maxWidth * 0.5, constraint.maxHeight * 0.08)));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                'Scan ID card',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 35),
              child: Text(
                'Scan your identification card for extra verification.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              Icons.qr_code_scanner,
              size: 150,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 45,
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, '/go');
                  final pickedCard =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                },
                style: buttonStyle,
                child: const Text('Scan')),
            const SizedBox(
              height: 25,
            ),
          ],
        );
      })),
    );
  }
}
