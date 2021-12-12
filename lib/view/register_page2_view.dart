import 'package:flutter/material.dart';
import 'package:pizzaapp/style.dart';
import 'package:pizzaapp/viewmodel/register_viewmodel.dart';
import 'package:pizzaapp/view/register_page1_view.dart';
import 'package:pizzaapp/view/register_page3_view.dart';

class RegisterPage2View extends StatefulWidget {
  const RegisterPage2View({Key? key}) : super(key: key);

  @override
  State<RegisterPage2View> createState() => _RegisterPage2ViewState();
}

class _RegisterPage2ViewState extends State<RegisterPage2View> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var myStyle = Style();
  var regVM = RegisterViewModel();
  final contllorerPswd = TextEditingController();
  final contllorerVerPswd = TextEditingController();

  @override
  void initState() {
    contllorerPswd.text = regVM.passwd;
    contllorerVerPswd.text = regVM.verPasswd;
    super.initState();
  }

  @override
  void dispose() {
    contllorerPswd.dispose();
    contllorerVerPswd.dispose();
    super.dispose();
  }

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
              AnimatedContainer(
              duration: const Duration(milliseconds: 750),
              height: regVM.page2Width,
              curve: Curves.bounceOut,
              width: 333,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // title
                  Text('Registrovat se', style: myStyle.h1,),

                  // password
                  AnimatedContainer(
                      height: regVM.pswdContainerHeight,
                      margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 0),
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.bounceOut,
                      decoration: BoxDecoration(
                        color: myStyle.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          myStyle.shadow,
                        ],
                      ),
                      child: Column (
                          children:[
                            TextFormField(
                              autofocus: false,
                              cursorWidth: 2,
                              cursorRadius: const Radius.circular(2),
                              cursorColor: myStyle.primary,
                              controller: contllorerPswd,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !regVM.pswdVis,
                              onChanged: (_pswd) async {
                                setState(() {
                                  regVM.passwd = _pswd;
                                });
                                await Future.delayed(const Duration(milliseconds: 150));
                                setState(() {
                                  regVM.canContinue2Logic();
                                  if (regVM.conteLowerCase) {
                                    regVM.lowrCaseColor = myStyle.highlight;
                                  } else {
                                    regVM.lowrCaseColor = myStyle.black;
                                  }
                                  if (regVM.conteCapitals) {
                                    regVM.capitalsColor = myStyle.highlight;
                                  } else {
                                    regVM.capitalsColor = myStyle.black;
                                  }
                                  if (regVM.conteDigits) {
                                    regVM.digitsColor = myStyle.highlight;
                                  } else {
                                    regVM.digitsColor = myStyle.black;
                                  }
                                  if (regVM.conte8chars) {
                                    regVM.charsColor = myStyle.highlight;
                                  } else {
                                    regVM.charsColor = myStyle.black;
                                  }
                                });

                              },
                              onTap: () async{
                                setState(()  {
                                  regVM.page2Width = 432;
                                  regVM.pswdContainerHeight = 138.5;
                                  regVM.pswdProgressBarHeight = 8;
                                  regVM.visPswdStren = true;
                                });
                                await Future.delayed(const Duration(milliseconds: 900));
                                setState(() {
                                  regVM.visPswdTip = true;
                                  regVM.pswdTipColor = myStyle.black;
                                });
                                if (regVM.lowrCaseColor == myStyle.white) {
                                  setState(() {
                                    regVM.lowrCaseColor = myStyle.black;
                                    regVM.capitalsColor = myStyle.black;
                                    regVM.digitsColor = myStyle.black;
                                    regVM.charsColor = myStyle.black;
                                  });
                                }
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
                                    onLongPress: () {setState(() {regVM.pswdVis = !regVM.pswdVis;});},
                                    onPressed: () {setState(() {regVM.pswdVis = !regVM.pswdVis;});},
                                    child: regVM.pswdVis ? myStyle.hidePswd : myStyle.showPswd,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                enabledBorder: myStyle.unfocused,
                                focusedBorder: myStyle.focused,
                                errorBorder: myStyle.errUnfocused,
                                focusedErrorBorder: myStyle.errfocused,
                              ),
                            ),
                            Visibility(
                              visible: regVM.visPswdTip,
                              child: AnimatedContainer(
                                height: regVM.pswdContainerHeight - 48,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                                padding: const EdgeInsets.all(5),
                                child:Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: AnimatedDefaultTextStyle(
                                          child: const Text(
                                            "Heslo musí obsahovat:",
                                            textAlign: TextAlign.center,),
                                          style: TextStyle(fontSize: 14, color: regVM.pswdTipColor),
                                          duration: const Duration(milliseconds: 250),
                                          curve: Curves.easeInOut,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: AnimatedDefaultTextStyle(
                                          child: const Text(
                                            "• Malé písmena",
                                            textAlign: TextAlign.left,),
                                          style: TextStyle(fontSize: 14, color: regVM.lowrCaseColor),
                                          duration: const Duration(milliseconds: 250),
                                          curve: Curves.easeInOut,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: AnimatedDefaultTextStyle(
                                          child: const Text(
                                            "• Velké písmena",
                                            textAlign: TextAlign.left,),
                                          style: TextStyle(fontSize: 14, color: regVM.capitalsColor),
                                          duration: const Duration(milliseconds: 250),
                                          curve: Curves.easeInOut,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: AnimatedDefaultTextStyle(
                                          child: const Text(
                                            "• Číslice",
                                            textAlign: TextAlign.left,),
                                          style: TextStyle(fontSize: 14, color: regVM.digitsColor),
                                          duration: const Duration(milliseconds: 250),
                                          curve: Curves.easeInOut,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: AnimatedDefaultTextStyle(
                                          child: const Text(
                                            "• 8 znaků",
                                            textAlign: TextAlign.left,),
                                          style: TextStyle(fontSize: 14, color: regVM.charsColor),
                                          duration: const Duration(milliseconds: 250),
                                          curve: Curves.easeInOut,
                                        ),
                                      ),

                                    ]
                                ),
                              ),
                            ),
                          ]
                      )
                  ),

                  Visibility(
                    visible: regVM.visPswdStren ,
                    child: AnimatedContainer(
                      height: regVM.pswdProgressBarHeight,
                      width: 333,
                      clipBehavior: Clip.antiAlias,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.easeInOutSine,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: myStyle.white,
                        boxShadow: [
                          BoxShadow(
                            color: myStyle.black.withOpacity(.25),
                            offset: const Offset(2,2),
                            blurRadius: 1,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Align (
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve:  Curves.bounceOut,
                          height: 8,
                          width: regVM.pswdStre(),
                          decoration: BoxDecoration(
                              color: regVM.colorPswdStre()
                          ),
                        ),
                      ),
                    ),
                  ),

                  // password verify
                  Container(
                    decoration: BoxDecoration(
                      color: myStyle.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        myStyle.shadow,
                      ],
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
                    child: TextFormField(
                      autofocus: false,
                      cursorWidth: 2,
                      cursorRadius: const Radius.circular(2),
                      cursorColor: myStyle.primary,
                      controller: contllorerVerPswd,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !regVM.verPswdVis,
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: (_pswd) async{
                        setState(()  {
                          regVM.verPasswd = _pswd;
                        });
                        await Future.delayed(const Duration(milliseconds: 150));
                        setState(() {
                          regVM.canContinue2Logic();
                        });
                      },
                      validator: (_verPswd) {
                        if (regVM.verPasswd.length < regVM.passwd.length ||
                            regVM.verPasswd.length == regVM.passwd.length &&
                                regVM.verPasswd == regVM.passwd) {
                          return null;
                        } else if (regVM.verPasswd.length == regVM.passwd.length &&
                            regVM.verPasswd != regVM.passwd) {
                          return "hesla se neshodují";
                        } else {
                          return "hesla se neshodují a jsou jinak dlouhá";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Ověření hesla",
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
                            onLongPress: () {setState(() {regVM.verPswdVis = !regVM.verPswdVis;});},
                            onPressed: () {setState(() {regVM.verPswdVis = !regVM.verPswdVis;});},
                            child: regVM.verPswdVis ? myStyle.hidePswd : myStyle.showPswd,
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

                  // continue button
                  Container(
                    height: 50,
                    width: 333,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: ElevatedButton(
                        style: myStyle.btnStyle(25),
                        onPressed: regVM.canContinue2 ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage3View()),
                          );
                        } : null,
                        child: Text("Pokračovat", style: myStyle.btnText, )
                    ),
                  ),

                  // back button
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
                        child: Text("Zpět", style: myStyle.invBtnText, )
                    ),
                  ),
                ],
              ),
            ),
              const SizedBox(height: 0),
            ]
          )
        ),
      ),
    );
  }
}