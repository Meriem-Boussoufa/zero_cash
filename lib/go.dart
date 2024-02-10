import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Go extends StatefulWidget {
  const Go({super.key});

  @override
  State<Go> createState() => _GoState();
}

class _GoState extends State<Go> {
  Future<bool> _requestPermission() async {
    var status = await Permission.contacts.request();
    var status1 = await Permission.location.request();
    if ((status.isGranted) && (status1.isGranted)) {
      if (await Geolocator.isLocationServiceEnabled()) {
        //Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      } else {
        LocationPermission permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }
      //List<Contact> contacts = await ContactsService.getContacts();
      return true;
    } else {
      if ((status.isDenied) && (status1.isDenied)) {
        _requestPermission();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraint) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                  child: Text(
                    'Create Account Successful',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(30),
                  width: 120,
                  height: 140,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 120,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (await _requestPermission()) {
                        // Route to Home Page
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/homepage');
                      } else {
                        const snackBar = SnackBar(
                          content: Text('No access to the applicaton !'),
                        );
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        _requestPermission();
                      }
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(
                          constraint.maxWidth * 0.8,
                          constraint.maxHeight * 0.07)),
                    ),
                    child: const Text('Go to HomePage'))
              ],
            ),
          );
        }),
      ),
    );
  }
}
