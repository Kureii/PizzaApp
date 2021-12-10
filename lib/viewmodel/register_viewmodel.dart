class RegisterViewModel {
  static final RegisterViewModel _registerViewModel = RegisterViewModel._internal();
  factory RegisterViewModel () {
    return _registerViewModel;
  }
  RegisterViewModel._internal();

  bool canContinue1 = false;
  String name = "";
  String surname = "";
  String mail = "";
  String passwd = "";
  String verPasswd = "";

  canContinue1Logic(){
    if (name.length > 1 && surname.length > 1 && mail.length > 5) {
      canContinue1 = true;
    } else {
      canContinue1 = false;
    }
  }
}