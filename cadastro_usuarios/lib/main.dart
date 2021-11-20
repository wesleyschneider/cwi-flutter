import 'package:cadastro_usuarios/pages/login.page.dart';
import 'package:cadastro_usuarios/pages/register.page.dart';
import 'package:cadastro_usuarios/pages/verify_code.page.dart';
import 'package:cadastro_usuarios/utils/color.util.dart';
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
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 34,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            color: ColorUtils.textColor,
          ),
          headline5: TextStyle(
            fontSize: 17,
            color: ColorUtils.textColor,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        primarySwatch: ColorUtils.primaryColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: ColorUtils.labelColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
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
