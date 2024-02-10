import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class UseFaceId extends StatefulWidget {
  const UseFaceId({super.key});

  @override
  State<UseFaceId> createState() => _UseFaceIdState();
}

class _UseFaceIdState extends State<UseFaceId> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: LayoutBuilder(builder: (context, constraint) {
        var buttonStyle = ButtonStyle(
            minimumSize: MaterialStatePropertyAll(
                Size(constraint.maxWidth * 0.6, constraint.maxHeight * 0.08)));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                'Create Face ID',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 35),
              child: Text(
                'You can use your face ID to log in to the app.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              Icons.document_scanner_sharp,
              size: 150,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 45,
            ),
            ElevatedButton(
                onPressed: () async {
                  var status = await Permission.camera.request();
                  if (status.isGranted) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(
                      context,
                      '/successfailure',
                    );
                  } else {
                    if (status.isDenied) {
                      await Permission.camera.request();
                    }
                    if (status.isLimited) {
                      await Permission.camera.request();
                    }
                    const snackBar = SnackBar(
                      content: Text('Cant take a photo!'),
                    );
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: buttonStyle,
                child: const Text('Scan')),
            const SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: () {},
              style: buttonStyle,
              child: const Text('Skip'),
            ),
          ],
        );
      })),
    );
  }
}
