import 'package:flutter/material.dart';
import 'package:pizzaapp/style.dart';
import 'package:pizzaapp/view/register_page1_view.dart';
import 'package:pizzaapp/viewmodel/login_viewmodel.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var myStyle = Style();
  var loginVM = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30),

              Container(
                height: 350,
                width: 333,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // title
                    Text('Přihlásit se', style: myStyle.h1,),

                    // email
                    Container(
                      decoration: BoxDecoration(
                        color: myStyle.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          myStyle.shadow
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
                      child: TextFormField(
                        autofocus: false,
                        cursorWidth: 2,
                        cursorRadius: const Radius.circular(2),
                        cursorColor: myStyle.primary,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (_mail) {
                          setState(() {
                            loginVM.mail = _mail;
                            loginVM.canLoginLogic();
                          });

                        },
                        validator: (String? _mail) {
                          if (EmailValidator.validate(loginVM.mail) || _mail == 'admin' ) {
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

                    // password
                    Container(
                      decoration: BoxDecoration(
                        color: myStyle.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          myStyle.shadow
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
                      child: TextFormField(
                        autofocus: false,
                        cursorWidth: 2,
                        cursorRadius: const Radius.circular(2),
                        cursorColor: myStyle.primary,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !loginVM.pswdVis,
                        onChanged: (_pswd) {
                          setState(() {
                            loginVM.passwd = _pswd;
                            loginVM.canLoginLogic();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Heslo",
                          labelStyle: myStyle.label,
                          suffixIcon: Container(
                            color: myStyle.transparent,
                            width: 10,
                            height: 45,
                            padding: const EdgeInsets.fromLTRB(0, 1, 1, 1),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: myStyle.transparent,
                                primary: myStyle.primary,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(6),
                                  ),
                                ),
                              ),
                              focusNode: FocusNode(
                                canRequestFocus: false,
                                skipTraversal: true,
                              ),
                              onLongPress: () {setState(() {loginVM.pswdVis = !loginVM.pswdVis;});},
                              onPressed: () {setState(() {loginVM.pswdVis = !loginVM.pswdVis;});},
                              child: loginVM.pswdVis ? myStyle.hidePswd : myStyle.showPswd,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: myStyle.unfocused,
                          focusedBorder: myStyle.focused,
                          errorBorder: myStyle.errUnfocused,
                          focusedErrorBorder: myStyle.errfocused,
                        ),
                      ),

                    ),

                    //extra space
                    Container(height: 10, color: myStyle.transparent,),

                    // login button
                    Container(
                      height: 50,
                      width: 333,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ElevatedButton(
                          style: myStyle.btnStyle(25),
                          onPressed: loginVM.canLogin ? () {
                            if (_formKey.currentState!.validate()) {
                              //TODO login method
                            }
                          } : null,
                          child: Text("Přihlásit se", style: myStyle.btnText, )
                      ),
                    ),

                    // register button
                    Container(
                      height: 50,
                      width: 333,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ElevatedButton(
                          style: myStyle.invBtnStyle(25),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage1View()),
                            );
                          },
                          child: Text("Registrovat se", style: myStyle.invBtnText, )
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}