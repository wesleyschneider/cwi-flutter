import 'package:cadastro_usuarios/pages/register.page.dart';
import 'package:cadastro_usuarios/widgets/button.widget.dart';
import 'package:cadastro_usuarios/widgets/text_input_form.widget.dart';
import 'package:cadastro_usuarios/widgets/title_page.widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class LoginPage extends StatefulWidget {
  static const String route = 'login_page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _login() {
    dev.log('email: ' + _emailController.text, name: runtimeType.toString());
    dev.log('password: ' + _passwordController.text,
        name: runtimeType.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlePageWidget(label: 'Login'),
                  SizedBox(height: 48),
                  TextInputFormWidget(
                    label: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Required field';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputFormWidget(
                    label: 'Password',
                    itsPassword: true,
                    controller: _passwordController,
                    validator: (text) {
                      if (text == null || text.length < 3) {
                        return 'Invalid password';
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RegisterPage.route,
                          arguments: RegisterPageArguments(
                            initialEmail: _emailController.text,
                          ),
                        );
                      },
                      child: Text("Don't have an account?"),
                    ),
                  ),
                  SizedBox(height: 34),
                  ButtonWidget(
                    onTap: () {
                      bool isValid = _formKey.currentState?.validate() ?? false;

                      if (isValid) _login();
                    },
                    title: 'Continue',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
