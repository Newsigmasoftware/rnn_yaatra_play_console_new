class LoginInterface {

  final bool invisiblePassword;

  LoginInterface({this.invisiblePassword = true});


  LoginInterface copyWith({
    bool? invPassword
  }) {
    return LoginInterface(
      invisiblePassword: invPassword ?? invisiblePassword
    );
  }

}