import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: LayoutBuilder(builder: (context, constraint) {
          var buttonStyle = ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(
                  constraint.maxWidth * 0.7, constraint.maxHeight * 0.08)));
          return Stack(alignment: AlignmentDirectional.topCenter, children: [
            Center(
              child: Card(
                elevation: 3,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: SizedBox(
                  height: constraint.maxHeight * 0.40,
                  width: constraint.maxWidth * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/chooseaccount'),
                        style: buttonStyle,
                        child: const Text('Create Account'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: buttonStyle,
                          child: const Text('Log In')),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: (() =>
                            Navigator.pushNamed(context, '/usefaceid')),
                        child: const Text(
                          'Use Face ID',
                          style: TextStyle(
                              color: Color.fromRGBO(136, 140, 151, 1),
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: mqh > 600
                  ? constraint.maxHeight * 0.22
                  : constraint.maxHeight * 0.16,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.5),
                  color: Theme.of(context).primaryColor,
                ),
                // Logo
                //child: Image.asset(''),
              ),
            ),
          ]);
        }));
  }
}
