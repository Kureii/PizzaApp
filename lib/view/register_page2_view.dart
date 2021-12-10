import 'package:flutter/material.dart';
import 'package:pizzaapp/style.dart';
import 'package:pizzaapp/viewmodel/register_viewmodel.dart';

class RegisterPage2View extends StatefulWidget {
  const RegisterPage2View({Key? key}) : super(key: key);

  @override
  State<RegisterPage2View> createState() => _RegisterPage2ViewState();
}

class _RegisterPage2ViewState extends State<RegisterPage2View> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var myStyle = Style();
  var regVM = RegisterViewModel();
  /*final contllorerName = TextEditingController();
  final contllorerSurname = TextEditingController();
  final contllorerMail = TextEditingController();

  @override
  void initState() {
    contllorerName.text = regVM.name;
    contllorerSurname.text = regVM.surname;
    contllorerMail.text = regVM.mail;
    super.initState();
  }

  @override
  void dispose() {
    contllorerName.dispose();
    contllorerSurname.dispose();
    contllorerMail.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: 400,
            width: 333,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // title
                Text('Registrovat se', style: myStyle.h1,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}