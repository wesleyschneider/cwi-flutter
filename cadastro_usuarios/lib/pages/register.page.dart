import 'package:cadastro_usuarios/pages/verify_code.page.dart';
import 'package:cadastro_usuarios/widgets/button.widget.dart';
import 'package:cadastro_usuarios/widgets/text_input_form.widget.dart';
import 'package:cadastro_usuarios/widgets/title_page.widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class RegisterPageArguments {
  final String? initialEmail;

  RegisterPageArguments({
    this.initialEmail,
  });
}

class RegisterPage extends StatelessWidget {
  static const String route = 'register_page';
  final RegisterPageArguments args;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final TextEditingController _referalCodeController = TextEditingController();

  List<Widget> buildInputsForm() {
    return [
      TextInputFormWidget(
        label: 'Full name',
        controller: _nameController,
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
        label: 'Email Address',
        initialValue: args.initialEmail,
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
        label: 'Mobile Number',
        controller: _mobileController,
        keyboardType: TextInputType.phone,
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
        label: 'Country',
        controller: _countryController,
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
      SizedBox(
        height: 10,
      ),
      TextInputFormWidget(
        label: 'Confirm Password',
        itsPassword: true,
        controller: _passwordConfirmationController,
        validator: (text) {
          if (text == null || text.length < 3) {
            return 'Invalid password';
          }
        },
      ),
      SizedBox(
        height: 10,
      ),
      TextInputFormWidget(
        label: 'Referal Code (Optional)',
        controller: _referalCodeController,
      ),
      SizedBox(
        height: 24,
      ),
    ];
  }

  _register(BuildContext context) {
    dev.log('nome: ' + _nameController.text, name: runtimeType.toString());
    dev.log('email: ' + _emailController.text, name: runtimeType.toString());
    dev.log('telefone: ' + _mobileController.text,
        name: runtimeType.toString());
    dev.log('país: ' + _countryController.text, name: runtimeType.toString());
    dev.log('senha: ' + _passwordController.text, name: runtimeType.toString());
    dev.log('confirmação da senha: ' + _passwordConfirmationController.text,
        name: runtimeType.toString());
    dev.log('cep: ' + _referalCodeController.text,
        name: runtimeType.toString());

    Navigator.pushNamed(
      context,
      VerifyCodePage.route,
      arguments: VerifyCodePageArguments(
        name: _nameController.text,
        email: _emailController.text,
        mobile: _mobileController.text,
        country: _countryController.text,
        password: _passwordController.text,
        confirmPassword: _passwordConfirmationController.text,
        referalCode: _referalCodeController.text,
      ),
    );
  }

  RegisterPage({
    Key? key,
    required this.args,
  }) : super(key: key) {
    if (args.initialEmail != null) {
      _emailController.text = args.initialEmail ?? '';
    }
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
                  TitlePageWidget(label: 'Register'),
                  SizedBox(height: 48),
                  ...buildInputsForm(),
                  ButtonWidget(
                    onTap: () {
                      bool isValid = _formKey.currentState?.validate() ?? false;

                      if (isValid) _register(context);
                    },
                    title: 'Register',
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
