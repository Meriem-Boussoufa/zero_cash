import 'package:flutter/material.dart';

class ChooseAccount extends StatefulWidget {
  const ChooseAccount({super.key});

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

class _ChooseAccountState extends State<ChooseAccount> {
  bool _isSelected = false;
  bool _isSelected1 = false;
  void _toggle() {
    setState(() {
      _isSelected1 = false;
      _isSelected = !_isSelected;
    });
  }

  void _toggle1() {
    setState(() {
      _isSelected = false;
      _isSelected1 = !_isSelected1;
    });
  }

  isTest() {}
  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).primaryColor,
            body: LayoutBuilder(builder: (context, constraint) {
              var buttonStyle = ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(
                    constraint.maxWidth * 0.7, constraint.maxHeight * 0.07)),
              );
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 80, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose an',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: mqh > 600 ? 45 : 35,
                          ),
                        ),
                        Text(
                          'Account Type',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: mqh > 600 ? 45 : 35),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: constraint.maxHeight * 0.6,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    child: Column(children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: 100,
                        height: 8,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(height: mqh > 600 ? 75 : 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () => _toggle(),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: mqh > 600 ? 150 : 100,
                                    color: !_isSelected
                                        ? Colors.grey
                                        : Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    'Personal',
                                    style: TextStyle(
                                        color: !_isSelected
                                            ? Colors.grey
                                            : Theme.of(context).primaryColor,
                                        fontSize: 20),
                                  )
                                ],
                              )),
                          InkWell(
                              onTap: () => _toggle1(),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.business,
                                    size: mqh > 600 ? 150 : 100,
                                    color: !_isSelected1
                                        ? Colors.grey
                                        : Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    'Business',
                                    style: TextStyle(
                                        color: !_isSelected1
                                            ? Colors.grey
                                            : Theme.of(context).primaryColor,
                                        fontSize: 20),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(25),
                          child: _isSelected
                              ? Column(
                                  children: const [
                                    Text(
                                      'Create a personal account to send and receive',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('money from friends and businesses',
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                )
                              : _isSelected1
                                  ? const Text(
                                      'Create a business account to accept customer payments',
                                      style: TextStyle(color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    )
                                  : const Text(' ')),
                      !_isSelected && !_isSelected1
                          ? OutlinedButton(
                              onPressed: () {
                                const snackBar = SnackBar(
                                  content:
                                      Text('Please choose an acount type !'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              style: buttonStyle,
                              child: const Text('Get Started'))
                          : ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/enterphoneNumber');
                              },
                              style: buttonStyle,
                              child: const Text('Get Started')),
                    ]),
                  )
                ],
              );
            })));
  }
}
