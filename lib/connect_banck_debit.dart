import 'package:flutter/material.dart';

class ConnectBanckorDebit extends StatefulWidget {
  const ConnectBanckorDebit({super.key});

  @override
  State<ConnectBanckorDebit> createState() => _ConnectBanckorDebitState();
}

class _ConnectBanckorDebitState extends State<ConnectBanckorDebit> {
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

  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraint) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Connect your bank account or debit card',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'You can add more cards and accounts later on.',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: constraint.maxHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () => _toggle(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_balance_outlined,
                            size: mqh > 600 ? 130 : 100,
                            color: !_isSelected
                                ? Colors.grey
                                : Theme.of(context).primaryColor,
                          ),
                          Text(
                            'Bank Account',
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
                            Icons.credit_card_outlined,
                            size: mqh > 600 ? 130 : 100,
                            color: !_isSelected1
                                ? Colors.grey
                                : Theme.of(context).primaryColor,
                          ),
                          Text(
                            'Debit Card',
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
              SizedBox(height: constraint.maxHeight * 0.1),
              !_isSelected && !_isSelected1
                  ? OutlinedButton(
                      onPressed: () {
                        const snackBar = SnackBar(
                          content: Text(
                              'Please choose an bank account or debit card !'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(
                            constraint.maxWidth * 0.7,
                            constraint.maxHeight * 0.07)),
                      ),
                      child: const Text('Next'))
                  : ElevatedButton(
                      onPressed: () {
                        if (_isSelected1) {
                          Navigator.pushNamed(context, '/debitcard');
                        }
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(
                            constraint.maxWidth * 0.7,
                            constraint.maxHeight * 0.07)),
                      ),
                      child: const Text('Next')),
              SizedBox(
                height: constraint.maxHeight * 0.02,
              ),
              ElevatedButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '');
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(
                        constraint.maxWidth * 0.7,
                        constraint.maxHeight * 0.07)),
                  ),
                  child: const Text('Skip')),
            ],
          );
        }),
      ),
    );
  }
}
