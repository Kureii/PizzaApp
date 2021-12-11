import 'package:flutter/material.dart';
import 'package:pizzaapp/style.dart';


class RegisterViewModel{
  static final RegisterViewModel _registerViewModel = RegisterViewModel._internal();
  factory RegisterViewModel () {
    return _registerViewModel;
  }
  RegisterViewModel._internal();


  var myStyle = Style();
  bool canContinue1 = false;
  String name = "";
  String surname = "";
  String mail = "";
  String passwd = "";
  String verPasswd = "";
  String birthdayText= "";
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
    if (name.length > 1 && surname.length > 1 && mail.length > 5 && birthdayText.length > 0) {
      canContinue1 = true;
    } else {
      canContinue1 = false;
    }
  }
}
