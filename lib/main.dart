import 'package:flutter/material.dart';
import 'package:zero_cash_app/choose_account.dart';
import 'package:zero_cash_app/confirm_code.dart';
import 'package:zero_cash_app/connect_banck_debit.dart';
import 'package:zero_cash_app/debit_card.dart';
import 'package:zero_cash_app/enter_phone_number.dart';
import 'package:zero_cash_app/first_screen.dart';
import 'package:zero_cash_app/name_password_created.dart';
import 'package:zero_cash_app/scann_card.dart';
import 'package:zero_cash_app/success_failure.dart';
import 'package:zero_cash_app/use_face_id.dart';

import 'go.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zero Cash Application',
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(1, 83, 45, 1), // <-- SEE HERE
              //onPrimary: Colors.redAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    const Color.fromRGBO(1, 83, 45, 1), // button text color
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            primaryColor: const Color.fromRGBO(1, 83, 45, 1),
            secondaryHeaderColor: const Color.fromRGBO(238, 238, 238, 1),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(1, 83, 45, 1),
                ),
                textStyle: const MaterialStatePropertyAll(TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.transparent)),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(238, 238, 238, 1),
              ),
              textStyle: MaterialStatePropertyAll(TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                foreground: Paint()..color = const Color.fromRGBO(1, 83, 45, 1),
              )),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              side: const MaterialStatePropertyAll(
                  BorderSide(color: Colors.transparent)),
            ))),
        routes: {
          '/chooseaccount': (context) => const ChooseAccount(),
          '/enterphoneNumber': (context) => const EnterPhoneNumber(),
          '/confirmcode': (context) => const ConfirmCode(),
          '/createnamepassword': (context) => const CreateNamePassword(),
          '/connectbanckordebit': (context) => const ConnectBanckorDebit(),
          '/debitcard': (context) => const DebitCard(),
          '/usefaceid': (context) => const UseFaceId(),
          '/scanncard': (context) => const ScannCard(),
          '/go': (context) => const Go(),
          '/homepage': (context) => const HomePage(),
          '/successfailure': (context) => const SuccessFailure()
        },
        home: const FirstScreen());
  }
}
