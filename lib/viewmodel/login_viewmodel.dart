class LoginViewModel {
  bool pswdVis = false;
  bool canLogin = false;
  String mail = "";
  String passwd = "";

  canLoginLogic () {
    canLogin = passwd.length > 4 && mail.length > 4;
  }
}