class UserModel {
  static const String _validEmail = "dev@gmail.com";
  static const String _validPassword = "12345";

  bool validateCredentails(String email, String password){
    return email == _validEmail && password == _validPassword;
  }
}