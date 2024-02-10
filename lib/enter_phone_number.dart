import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterPhoneNumber extends StatefulWidget {
  const EnterPhoneNumber({super.key});

  @override
  State<EnterPhoneNumber> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Add listener to the focus node to change the color of the labelText
    // when the TextField is in focus
    _focusNode.addListener(() {
      setState(() {});
    });

    // Add listener to the text controller to change the color of the labelText
    // when the TextField has text
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose the focus node and text controller
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool validate = true;
  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraint) {
        var buttonStyle = ButtonStyle(
          minimumSize: MaterialStatePropertyAll(
              Size(constraint.maxWidth * 0.8, constraint.maxHeight * 0.07)),
        );
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Enter your phone number',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'You\'ll receive a text with a code to confirm your number.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 20, 25, 7),
                    child: TextFormField(
                      validator: (value) {
                        if ((value!.contains(RegExp(r'^(?=.*?[A-Z])'))) ||
                            (value.contains(RegExp(r'^(?=.*?[*()#;,.+-/])')))) {
                          validate = false;
                          return 'Incorrect phone number';
                        } else {
                          validate = true;
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.always,
                      cursorColor: Theme.of(context).primaryColor,
                      controller: _controller,
                      focusNode: _focusNode,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: mqh > 600
                            ? const EdgeInsets.fromLTRB(12, 24, 12, 16)
                            : const EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: _controller.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            )),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                            color: !_controller.text.isNotEmpty &&
                                    !_focusNode.hasFocus
                                ? Colors.grey
                                : validate
                                    ? Theme.of(context).primaryColor
                                    : const Color.fromRGBO(176, 0, 32, 1)),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Use my email address instead',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 15, 25, 25),
                    child: const Text(
                      'By tapping Send Code, you confirm that you are authorized to use the phone number entered and agree to receive SMS texts verifying your identity.',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  _controller.text.length == 10 &&
                          !_controller.text
                              .contains(RegExp(r'^(?=.*?[A-Z])')) &&
                          !_controller.text
                              .contains(RegExp(r'^(?=.*?[*()#;,.+-/])'))
                      ? ElevatedButton(
                          onPressed: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            Navigator.pushNamed(context, '/confirmcode');
                          },
                          style: buttonStyle,
                          child: const Text('Send Code'))
                      : OutlinedButton(
                          onPressed: () {},
                          style: buttonStyle,
                          child: const Text('Send Code')),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
