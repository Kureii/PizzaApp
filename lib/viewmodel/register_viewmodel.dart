import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pizzaapp/style.dart';


class RegisterViewModel{
  static final RegisterViewModel _registerViewModel = RegisterViewModel._internal();
  factory RegisterViewModel () {
    return _registerViewModel;
  }
  RegisterViewModel._internal();

  static var myStyle = Style();

  bool canContinue1 = false;
  bool canContinue2 = false;
  bool canRegister = false;
  bool pswdVis = false;
  bool verPswdVis = false;
  bool visPswdTip = false;
  bool visPswdStren = false;
  bool conteLowerCase = false;
  bool conteCapitals = false;
  bool conteDigits = false;
  bool conte8chars = false;
  double page2Width = 340;
  double pswdStrenColTmp = 0.0;
  double pswdContainerHeight = 48.0;
  double pswdProgressBarHeight = 0.0;
  String name = "";
  String surname = "";
  String mail = "";
  String passwd = "";
  String verPasswd = "";
  String birthdayText= "";
  Color pswdTipColor = myStyle.white;
  Color lowrCaseColor = myStyle.white;
  Color capitalsColor = myStyle.white;
  Color digitsColor = myStyle.white;
  Color charsColor = myStyle.white;

  DateTime birthday = DateTime.now();



  Future<void> selectDate(BuildContext context) async {

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 135),
      lastDate: DateTime(DateTime.now().year - 15),
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Vyberte datum narození',
      errorFormatText: 'Zapište datum správně (měsíc.den.rok)',
      errorInvalidText: 'Zaregistrovat se smí pouze osoba starší 15 let.',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            dialogBackgroundColor: myStyle.white,
            colorScheme: ColorScheme.light(
              primary: myStyle.primary,
              onPrimary: myStyle.white,
              onSurface: myStyle.black,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!
        );
      },
    );
    if (pickedDate != null) {
      birthday = pickedDate;
      birthdayText ='${birthday.day}. ${birthday.month}. ${birthday.year}';
    }
  }

  canContinue1Logic(){
    if (name.length > 1 && surname.length > 1 && mail.length > 5 && birthdayText.length > 1) {
      canContinue1 = true;
    } else {
      canContinue1 = false;
    }
  }

  canContinue2Logic(){
    if (passwd.length >= 8 && passwd == verPasswd && pswdStrenColTmp > 26) {
      canContinue2 = true;
    } else {
      canContinue2 = false;
    }
  }

  canRegisterLogic(){

  }

  pswdStre () {
    double tmp = 0.0 + passwd.length;

    RegExp chars = RegExp(r"[a-z]",
                      caseSensitive: true,
                      unicode: true);
    if (chars.hasMatch(passwd)) {
      tmp += 5;
      conteLowerCase = true;
    } else {
      conteLowerCase = false;
    }
    RegExp capitals = RegExp(r"[A-Z]",
                      caseSensitive: true,
                      unicode: true);
    if (capitals.hasMatch(passwd)) {
      tmp += 7;
      conteCapitals = true;
    } else {
      conteCapitals = false;
    }
    RegExp numbers = RegExp(r"\d");
    if (numbers.hasMatch(passwd)) {
      tmp += 6;
      conteDigits = true;
    } else {
      conteDigits = false;
    }
    RegExp specials = RegExp(r"[!@#\$%\^\&*\)\(+=._-]");
    if (specials.hasMatch(passwd)) tmp += 10;
    if (passwd.length >= 8) {
      conte8chars = true;
    } else {
      conte8chars = false;
    }
    if (passwd.length < 8 &&  tmp > 26) {
      pswdStrenColTmp = 26;
      return .26 * 333;
    } else if (passwd.length >= 8 &&
        (!conteLowerCase ||
        !conteCapitals ||
        !conteDigits)
    ) {
      pswdStrenColTmp = 26;
      return .26 * 333;
    }
    else if (passwd.length >= 8 && passwd.length < 16)
    { tmp += log(passwd.length) + passwd.length * .25; }
    else if (passwd.length >= 16 && passwd.length < 32)
    { tmp += pow(1.125, passwd.length); }
    else if (passwd.length >= 32)
    { tmp += pow(passwd.length, 1.1); }
    if (tmp > 100) { tmp = 100; }
    pswdStrenColTmp = tmp;
    return tmp * 3.33;
  }

  colorPswdStre() {
    int value = pswdStrenColTmp.round();
    late int red;
    int blue = 32;
    late int green;
    if (value <= 25)
    {
      red = 200  - value;
      green = 2 * value;
    }
    else
    {
      red = 200 - value + log(value).round();
      green = 2 * value + log(value).round();
    }
    return Color.fromARGB(255, red, green, blue);
  }

}
