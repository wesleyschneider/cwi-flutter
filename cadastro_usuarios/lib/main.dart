import 'package:cadastro_usuarios/pages/login.page.dart';
import 'package:cadastro_usuarios/pages/register.page.dart';
import 'package:cadastro_usuarios/pages/verify_code.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User registration',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => const LoginPage(),
        RegisterPage.route: (context) => RegisterPage(
              args: ModalRoute.of(context)!.settings.arguments
                  as RegisterPageArguments,
            ),
        VerifyCodePage.route: (context) => VerifyCodePage(
              args: ModalRoute.of(context)!.settings.arguments
                  as VerifyCodePageArguments,
            ),
      },
    );
  }
}
