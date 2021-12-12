import 'package:flutter/material.dart';
import 'package:pizzaapp/style.dart';
import 'package:pizzaapp/viewmodel/register_viewmodel.dart';
import 'package:pizzaapp/view/register_page2_view.dart';
import 'package:pizzaapp/view/personal_data_view.dart';

class RegisterPage3View extends StatefulWidget {
  const RegisterPage3View({Key? key}) : super(key: key);

  @override
  State<RegisterPage3View> createState() => _RegisterPage3ViewState();
}

class _RegisterPage3ViewState extends State<RegisterPage3View> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var myStyle = Style();
  var regVM = RegisterViewModel();
  final contllorerTown = TextEditingController();
  final contllorerStreet = TextEditingController();
  final contllorerZip = TextEditingController();

  @override
  void initState() {
    contllorerTown.text = regVM.town;
    contllorerStreet.text = regVM.street;
    contllorerZip.text = regVM.zip;
    super.initState();
  }

  @override
  void dispose() {
    contllorerTown.dispose();
    contllorerStreet.dispose();
    contllorerZip.dispose();
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

              SizedBox(
                height: 435,
                width: 333,
                child: Column(
                  children: [
                    // title
                    Text('Registrovat se', style: myStyle.h1,),

                    // village
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
                        controller: contllorerTown,
                        cursorWidth: 2,
                        cursorRadius: const Radius.circular(2),
                        cursorColor: myStyle.primary,
                        keyboardType: TextInputType.name,
                        onChanged: (_vill) {
                          setState(() {
                            regVM.town = _vill;
                            regVM.canRegisterLogic();
                          });

                        },
                        decoration: InputDecoration(
                          labelText: "Obec",
                          labelStyle: myStyle.label,
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: myStyle.unfocused,
                          focusedBorder: myStyle.focused,
                          errorBorder: myStyle.errUnfocused,
                          focusedErrorBorder: myStyle.errfocused,
                        ),
                      ),
                    ),

                    // street
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
                        controller: contllorerStreet,
                        cursorWidth: 2,
                        cursorRadius: const Radius.circular(2),
                        cursorColor: myStyle.primary,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (_street) {
                          setState(() {
                            regVM.street = _street;
                            regVM.canRegisterLogic();
                          });
                        },
                        validator: (String? _street) {
                          RegExp vali = RegExp(r"^[A-ZÁ-Ž]([a-zA-Zá-žÁ-Ž]+\s)+\d+$");
                          if (vali.hasMatch(_street!)) {
                            return null;
                          } else {
                            return "Špatně zadaná ulice";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Ulice a č. p.",
                          labelStyle: myStyle.label,
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: myStyle.unfocused,
                          focusedBorder: myStyle.focused,
                          errorBorder: myStyle.errUnfocused,
                          focusedErrorBorder: myStyle.errfocused,
                        ),
                      ),
                    ),

                    // ZIP code
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
                        controller: contllorerZip,
                        cursorWidth: 2,
                        cursorRadius: const Radius.circular(2),
                        cursorColor: myStyle.primary,
                        keyboardType: TextInputType.number,
                        onChanged: (_zip) {
                          setState(() {
                            regVM.zip = _zip;
                            regVM.canRegisterLogic();
                          });
                        },
                        validator: (String? _zip) {
                          RegExp vali = RegExp(r"^\d{3} *\d{2}$");
                          if (vali.hasMatch(_zip!)){
                            return null;
                          } else {
                            return 'Zadejte PČS korektně (xxx xx nebo xxxxx)';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "PSČ",
                          labelStyle: myStyle.label,
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: myStyle.unfocused,
                          focusedBorder: myStyle.focused,
                          errorBorder: myStyle.errUnfocused,
                          focusedErrorBorder: myStyle.errfocused,
                        ),
                      ),
                    ),

                    // agree licence
                    Container(
                      width: 333,
                      height: 40,
                      margin: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: myStyle.white,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          myStyle.shadow
                        ]
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async{
                              if (regVM.chboxCircleSize == 0) {
                                setState(()  {
                                  regVM.condiAgree = true;
                                  regVM.chboxCircleSize = 30;
                                });
                                await Future.delayed(const Duration(milliseconds: 210));
                                setState(() {
                                  regVM.chboxColor = myStyle.primary;
                                });
                              } else {
                                setState(()  {
                                  regVM.condiAgree = false;
                                  regVM.chboxCircleSize = 0;
                                  regVM.chboxColor = myStyle.white;
                                });
                              }
                              regVM.canRegisterLogic();
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 50),
                              height: 20,
                              width: 20,
                              curve: Curves.easeOutSine,
                              decoration: BoxDecoration(
                                color: regVM.chboxColor,
                                borderRadius: const BorderRadius.all(Radius.circular(6)),
                                border: Border.all(color: myStyle.primary, width: 2),
                                boxShadow: [myStyle.shadow]
                              ),

                              child: Align (
                                alignment: Alignment.center,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeInOutQuint,
                                  height: regVM.chboxCircleSize,
                                  width: regVM.chboxCircleSize,
                                  decoration: BoxDecoration(
                                    color: myStyle.primary,
                                    borderRadius:const BorderRadius.all(Radius.circular(4))
                                  ),
                                  child:Container(
                                    margin: const EdgeInsets.all(2),
                                    width: 1,
                                    height: 1,
                                    child: myStyle.okSymbol,
                                  )
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 8,
                          ),
                          const Text('Přečetl/a jsem si '),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const PerosnalDataView()),
                              );
                            },
                            child: Text(
                              'podmínky',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: myStyle.primary
                              ),
                            )
                          ),
                          const Text(' a sohlasím s nimi.'),
                        ]
                      ),
                    ),

                    //extra space
                    const SizedBox(height: 10,),

                    // register button
                    Container(
                      height: 50,
                      width: 333,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ElevatedButton(
                          style: myStyle.btnStyle(25),
                          onPressed: regVM.canRegister ? () {
                            if (_formKey.currentState!.validate()) {
                              if (true /*TODO rigster method*/) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterPage2View()),
                                );
                              } else {
                                //TODO error message
                              }
                            }
                          } : null,
                          child: Text("Registrovat se", style: myStyle.btnText, )
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
                              MaterialPageRoute(builder: (context) => const RegisterPage2View()),
                            );
                          },
                          child: Text("Zpět", style: myStyle.invBtnText, )
                      ),
                    ),
                  ],
                )
            ),

              const SizedBox(height: 0),
            ]
          )
        ),
      ),
    );
  }
}