import 'package:flutter/material.dart';
import 'package:pizzaapp/style.dart';
import 'package:pizzaapp/view/login_view.dart';
import 'package:pizzaapp/view/register_page2_view.dart';
import 'package:pizzaapp/viewmodel/register_viewmodel.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage1View extends StatefulWidget {
  const RegisterPage1View({Key? key}) : super(key: key);

  @override
  State<RegisterPage1View> createState() => _RegisterPage1ViewState();
}

class _RegisterPage1ViewState extends State<RegisterPage1View> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var myStyle = Style();
  var regVM = RegisterViewModel();
  final contllorerName = TextEditingController();
  final contllorerSurname = TextEditingController();
  final contllorerMail = TextEditingController();
  final contllorerDateText = TextEditingController();

  @override
  void initState(){
    contllorerName.text = regVM.name;
    contllorerSurname.text = regVM.surname;
    contllorerMail.text = regVM.mail;
    contllorerDateText.text = regVM.birthdayText;
    super.initState();
  }

  @override
  void dispose() {
    contllorerName.dispose();
    contllorerSurname.dispose();
    contllorerMail.dispose();
    contllorerDateText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: 500,
            width: 333,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // title
                Text('Registrovat se', style: myStyle.h1,),

                // name
                Container(
                  decoration: BoxDecoration(
                    color: myStyle.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow (
                        color: myStyle.black.withOpacity(.25),
                        offset: const Offset(2,2),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
                  child: TextFormField(
                    autofocus: false,
                    cursorWidth: 2,
                    cursorRadius: const Radius.circular(2),
                    cursorColor: myStyle.primary,
                    keyboardType: TextInputType.name,
                    controller: contllorerName,
                    onChanged: (_name) {
                      setState(() {
                        regVM.name = _name;
                        regVM.canContinue1Logic();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Jméno",
                      labelStyle: myStyle.label,
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: myStyle.unfocused,
                      focusedBorder: myStyle.focused,
                      errorBorder: myStyle.errUnfocused,
                      focusedErrorBorder: myStyle.errfocused,
                    ),
                  ),
                ),

                // surname
                Container(
                  decoration: BoxDecoration(
                    color: myStyle.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow (
                        color: myStyle.black.withOpacity(.25),
                        offset: const Offset(2,2),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
                  child: TextFormField(
                    autofocus: false,
                    controller: contllorerSurname,
                    cursorWidth: 2,
                    cursorRadius: const Radius.circular(2),
                    cursorColor: myStyle.primary,
                    keyboardType: TextInputType.name,
                    onChanged: (_surname) {
                      setState(() {
                        regVM.surname = _surname;
                        regVM.canContinue1Logic();
                      });

                    },
                    decoration: InputDecoration(
                      labelText: "Příjmení",
                      labelStyle: myStyle.label,
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: myStyle.unfocused,
                      focusedBorder: myStyle.focused,
                      errorBorder: myStyle.errUnfocused,
                      focusedErrorBorder: myStyle.errfocused,
                    ),
                  ),
                ),

                //  birthdate
                Container(
                  height: 48,
                  width: 333,
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: myStyle.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow (
                        color: myStyle.black.withOpacity(.25),
                        offset: const Offset(2,2),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    autofocus: false,
                    readOnly: true,
                    controller: contllorerDateText,
                    focusNode: FocusNode(
                      canRequestFocus: false,
                      skipTraversal: true,
                    ),
                    onTap: () async {
                      await regVM.selectDate(context);
                      setState(() {
                        contllorerDateText.text = regVM.birthdayText;
                        regVM.canContinue1Logic();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Datum narození",
                      labelStyle: myStyle.label,
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: myStyle.unfocused,
                      focusedBorder: myStyle.focused,
                      errorBorder: myStyle.errUnfocused,
                      focusedErrorBorder: myStyle.errfocused,
                    ),
                  ),
                ),

                // email
                Container(
                  decoration: BoxDecoration(
                    color: myStyle.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow (
                        color: myStyle.black.withOpacity(.25),
                        offset: const Offset(2,2),
                        blurRadius: 1,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
                  child: TextFormField(
                    autofocus: false,
                    controller: contllorerMail,
                    cursorWidth: 2,
                    cursorRadius: const Radius.circular(2),
                    cursorColor: myStyle.primary,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_mail) {
                      setState(() {
                        regVM.mail = _mail;
                        regVM.canContinue1Logic();
                      });

                    },
                    validator: (String? _mail) {
                      if (EmailValidator.validate(regVM.mail) || _mail == 'admin' ) {
                        return null;
                      } else {
                        return 'E-mail není zadán korektně.';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: myStyle.label,
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: myStyle.unfocused,
                      focusedBorder: myStyle.focused,
                      errorBorder: myStyle.errUnfocused,
                      focusedErrorBorder: myStyle.errfocused,
                    ),
                  ),
                ),

                // continue button
                Container(
                  height: 50,
                  width: 333,
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: ElevatedButton(
                      style: myStyle.btnStyle(25),
                      onPressed: regVM.canContinue1 ? () {
                        if (_formKey.currentState!.validate()) {
                         if (true /*TODO verify db mail method*/) {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const RegisterPage2View()),
                           );
                         } else {
                           //TODO error message
                         }
                        }
                      } : null,
                      child: Text("Pokračovat", style: myStyle.btnText, )
                  ),
                ),

                // login button
                Container(
                  height: 50,
                  width: 333,
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: ElevatedButton(
                      style: myStyle.invBtnStyle(25),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginView()),
                        );
                      },
                      child: Text("Přihlásit se", style: myStyle.invBtnText, )
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}