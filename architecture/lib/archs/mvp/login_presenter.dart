import 'package:flutter/material.dart';
import 'package:mvc/archs/mvc/user_model.dart';

import 'login_repository.dart';

abstract class LoginPageContract {
  void loginSucess();
  void loginFail();
  void loginManager();
}

class LoginPresenter {
  final formKey = GlobalKey<FormState>();

  final LoginRepository repository;
  final LoginPageContract viewContract;
  bool isLoading = false;

  LoginPresenter(this.viewContract, {this.repository});

  UserModel user = UserModel();

  userEmail(String value) => user.email = value;
  userPassword(String value) => user.password = value;

  login() async {
    bool isLogin;
    isLoading = true;
    viewContract.loginManager();

    if (!formKey.currentState.validate()) {
      isLogin = false;
    } else {
      formKey.currentState.save();

      try {
        isLogin = await repository.doLogin(user);
      } catch (e) {
        isLogin = false;
      }
    }

    isLoading = false;
    viewContract.loginManager();

    if (isLogin) {
      viewContract.loginSucess();
      return;
    } else {
      viewContract.loginFail();
    }
  }
}
