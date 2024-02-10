import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({super.key});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Enter the code',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const Text(
              'We sent a 4 digit code to: ',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            // The phone Number
            const Text(
              '###',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(50, 25, 50, 10),
              child: PinCodeTextField(
                // Verify the code
                onCompleted: (newValue) {
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  Navigator.pushReplacementNamed(
                      context, '/createnamepassword');
                },
                appContext: context,
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
                length: 4,
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(10),
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.grey,
                  activeColor: Theme.of(context).primaryColor,
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 60,
                  fieldWidth: 60,
                ),
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                    currentText = value;
                  });
                },
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                'Resend code',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
