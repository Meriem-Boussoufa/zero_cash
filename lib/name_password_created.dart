import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateNamePassword extends StatefulWidget {
  const CreateNamePassword({super.key});

  @override
  State<CreateNamePassword> createState() => _CreateNamePasswordState();
}

class _CreateNamePasswordState extends State<CreateNamePassword> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller0 = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode0 = FocusNode();
  final FocusNode _focusNode1 = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
    _focusNode0.addListener(() {
      setState(() {});
    });
    _focusNode1.addListener(() {
      setState(() {});
    });
    _controller.addListener(() {
      setState(() {});
    });
    _controller0.addListener(() {
      setState(() {});
    });
    _controller1.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _focusNode0.dispose();
    _focusNode1.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool validate = true;
  bool validate0 = true;
  bool validate1 = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraint) {
        var buttonstyle = ButtonStyle(
          minimumSize: MaterialStatePropertyAll(
              Size(constraint.maxWidth * 0.8, constraint.maxHeight * 0.07)),
        );

        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Create your own username',
                          style: TextStyle(
                              fontSize: mqh > 600 ? 30 : 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 15, 25, 7),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.contains('@')) {
                              validate = false;
                              return 'Do not use the @ char.';
                            } else {
                              validate = true;
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.always,
                          focusNode: _focusNode,
                          cursorColor: Theme.of(context).primaryColor,
                          controller: _controller,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                          keyboardType: TextInputType.text,
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
                            labelText: 'Username',
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
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'Create a password',
                            style: TextStyle(
                                fontSize: mqh > 600 ? 30 : 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 15, 25, 7),
                        child: TextFormField(
                          validator: (value) {
                            if ((value!.isNotEmpty) &&
                                !(value.contains(RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')))) {
                              validate0 = false;
                              return 'Password must be large';
                            } else {
                              validate0 = true;
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.always,
                          focusNode: _focusNode0,
                          obscureText: true,
                          obscuringCharacter: '*',
                          cursorColor: Theme.of(context).primaryColor,
                          controller: _controller0,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: mqh > 600
                                ? const EdgeInsets.fromLTRB(12, 24, 12, 16)
                                : const EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: _focusNode0.hasFocus ||
                                          _controller0.text.isNotEmpty
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                )),
                            labelText: 'New Password',
                            labelStyle: TextStyle(
                                color: !_controller0.text.isNotEmpty &&
                                        !_focusNode0.hasFocus
                                    ? Colors.grey
                                    : validate0
                                        ? Theme.of(context).primaryColor
                                        : const Color.fromRGBO(176, 0, 32, 1)),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 15, 25, 7),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          validator: (value) {
                            if ((value!.isNotEmpty) &&
                                !(value.contains(RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')))) {
                              validate1 = false;
                              return 'Password does not match';
                            } else {
                              if (_controller0.text == _controller1.text) {
                                validate1 = true;
                              }

                              return null;
                            }
                          },
                          focusNode: _focusNode1,
                          obscureText: true,
                          obscuringCharacter: '*',
                          cursorColor: Theme.of(context).primaryColor,
                          controller: _controller1,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: mqh > 600
                                ? const EdgeInsets.fromLTRB(12, 24, 12, 16)
                                : const EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: _controller1.text.isNotEmpty
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                )),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: !_controller1.text.isNotEmpty &&
                                        !_focusNode1.hasFocus
                                    ? Colors.grey
                                    : validate1
                                        ? Theme.of(context).primaryColor
                                        : const Color.fromRGBO(176, 0, 32, 1)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _controller.text.isNotEmpty &&
                              _controller0.text.isNotEmpty &&
                              _controller1.text.isNotEmpty &&
                              !_controller.text.contains('@') &&
                              _controller0.text.contains(RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')) &&
                              _controller1.text.contains(RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')) &&
                              (_controller0.text == _controller1.text)
                          ? Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      SystemChannels.textInput
                                          .invokeMethod('TextInput.hide');
                                      Navigator.pushNamed(
                                          context, '/connectbanckordebit');
                                    }
                                  },
                                  style: buttonstyle,
                                  child: const Text('Next')),
                            )
                          : Center(
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: buttonstyle,
                                  child: const Text('Next')),
                            ),
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
