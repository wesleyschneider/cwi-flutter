import 'package:mvc/archs/mvc/user_model.dart';

class LoginRepository {
  Future<bool> doLogin(UserModel user) async {
    //API Conection
    await Future.delayed(Duration(seconds: 2));
    return user.email == 'juliano@cwi.com' && user.password == '123';
  }
}
