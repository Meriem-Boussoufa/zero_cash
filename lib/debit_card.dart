import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DebitCard extends StatefulWidget {
  const DebitCard({super.key});

  @override
  State<DebitCard> createState() => _DebitCardState();
}

class _DebitCardState extends State<DebitCard> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller0 = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode0 = FocusNode();
  final FocusNode _focusNode1 = FocusNode();
  String? initValue = 'Wilaya';
  bool isSelected = false;
  var items = [
    '01 Adrar',
    '02 Chlef',
    '03 Laghouat',
    '04 Oum El Bouaghi',
    '05 Batna',
    '06 Béjaïa',
    '07 Biskra',
    '08 Béchar',
    '09 Blida',
    '10 Bouira',
    '11 Tamanrasset',
    '12 Tébessa',
    '13 Tlemcen',
    '14 Tiaret',
    '15 Tizi Ouzou',
    '16 Alger',
    '17 Djelfa',
    '18 Jijel',
    '19 Sétif',
    '20 Saïda',
    '21 Skikda',
    '22 Sidi Bel Abbès',
    '23 Annaba',
    '24 Guelma',
    '25 Constantine',
    '26 Médéa',
    '27 Mostaganem',
    '28 M\'Sila',
    '29 Mascara',
    '30 Ouargla',
    '31 Oran',
    '32 El Bayadh',
    '33 Illizi',
    '34 Bordj Bou Arréridj',
    '35 Boumerdès',
    '36 El Tarf',
    '37 Tindouf',
    '38 Tissemsilt',
    '39 El Oued',
    '40 Khenchela',
    '41 Souk Ahras',
    '42 Tipaza',
    '43 Mila',
    '44 Aïn Defla',
    '45 Naâma',
    '46 Aïn Témouchent',
    '47 Ghardaïa',
    '48 Relizane'
  ];

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
    _controller0.dispose();
    _controller1.dispose();
    super.dispose();
  }

  late DateTime _selectedDate;
  Future<void> _datePicker(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        _selectedDate = value;
        _controller0.text = DateFormat.yMMMd().format(_selectedDate).toString();
      }
    });
  }

  bool validate = true;
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Link your debit card',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 15, 25, 7),
                    child: TextFormField(
                      validator: (value) {
                        if ((value!
                            .contains(RegExp(r'^(?=.*?[*()#;,.+-/])')))) {
                          validate = false;
                          return 'Incorrect card number';
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
                      keyboardType: TextInputType.number,
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
                        labelText: 'Card Number',
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
                      margin: const EdgeInsets.fromLTRB(25, 15, 25, 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextField(
                              onTap: () {
                                _datePicker(context);
                              },
                              readOnly: true,
                              focusNode: _focusNode0,
                              cursorColor: Theme.of(context).primaryColor,
                              controller: _controller0,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                              decoration: InputDecoration(
                                contentPadding: mqh > 600
                                    ? const EdgeInsets.fromLTRB(12, 24, 12, 16)
                                    : const EdgeInsets.all(15),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: _controller0.text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                    )),
                                labelText: 'Expiration Date',
                                labelStyle: TextStyle(
                                    color: _controller0.text.isNotEmpty ||
                                            _focusNode0.hasFocus
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: TextField(
                                focusNode: _focusNode1,
                                cursorColor: Theme.of(context).primaryColor,
                                controller: _controller1,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: mqh > 600
                                      ? const EdgeInsets.fromLTRB(
                                          12, 24, 12, 16)
                                      : const EdgeInsets.all(15),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      borderSide: BorderSide(
                                        color: _controller1.text.isNotEmpty
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                      )),
                                  labelText: 'Security code',
                                  labelStyle: TextStyle(
                                      color: _controller1.text.isNotEmpty ||
                                              _focusNode1.hasFocus
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 15, 25, 7),
                    child: DropdownButton(
                      underline: Container(
                        height: 1.5,
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      iconSize: 30,
                      isExpanded: true,
                      hint: Text(
                        '$initValue',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.grey),
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          initValue = newValue;
                          isSelected = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _controller.text.isNotEmpty &&
                          _controller0.text.isNotEmpty &&
                          _controller1.text.isNotEmpty &&
                          isSelected &&
                          !_controller.text
                              .contains(RegExp(r'^(?=.*?[*()#;,.+-/])'))
                      ? ElevatedButton(
                          onPressed: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            Navigator.pushNamed(context, '/usefaceid');
                          },
                          style: buttonstyle,
                          child: const Text('Save and Continue'))
                      : OutlinedButton(
                          onPressed: () {},
                          style: buttonstyle,
                          child: const Text('Save and Continue')),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
