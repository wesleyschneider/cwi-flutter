import 'package:cadastro_usuarios/widgets/button.widget.dart';
import 'package:cadastro_usuarios/widgets/text_input_form.widget.dart';
import 'package:cadastro_usuarios/widgets/title_page.widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class VerifyCodePageArguments {
  final String name;
  final String email;
  final String mobile;
  final String country;
  final String password;
  final String confirmPassword;
  final String? referalCode;

  VerifyCodePageArguments({
    required this.name,
    required this.email,
    required this.mobile,
    required this.country,
    required this.password,
    required this.confirmPassword,
    this.referalCode,
  });
}

class VerifyCodePage extends StatelessWidget {
  static const route = 'verify_code_page';

  final VerifyCodePageArguments args;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();

  VerifyCodePage({Key? key, required this.args}) : super(key: key);

  _submit() {
    dev.log('nome: ' + args.name, name: runtimeType.toString());
    dev.log('email: ' + args.email, name: runtimeType.toString());
    dev.log('telefone: ' + args.mobile, name: runtimeType.toString());
    dev.log('país: ' + args.country, name: runtimeType.toString());
    dev.log('senha: ' + args.password, name: runtimeType.toString());
    dev.log('confirmação da senha: ' + args.confirmPassword,
        name: runtimeType.toString());
    dev.log('cep: ' + (args.referalCode ?? ''), name: runtimeType.toString());

    dev.log(
        'code: ' +
            ('${_firstController.text}${_secondController.text}${_thirdController.text}${_fourthController.text}'),
        name: runtimeType.toString());
  }

  _validateField(String? text) {
    if (text == null || text.isEmpty) {
      return '*';
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
                  TitlePageWidget(label: 'Verification'),
                  SizedBox(height: 7),
                  Text(
                    'a four digit verification code has been sent to your mobile number',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 45,
                        child: TextInputFormWidget(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          controller: _firstController,
                          validator: (text) => _validateField(text),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      SizedBox(
                        width: 45,
                        child: TextInputFormWidget(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          controller: _secondController,
                          validator: (text) => _validateField(text),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      SizedBox(
                        width: 45,
                        child: TextInputFormWidget(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          controller: _thirdController,
                          validator: (text) => _validateField(text),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      SizedBox(
                        width: 45,
                        child: TextInputFormWidget(
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          controller: _fourthController,
                          validator: (text) => _validateField(text),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 93),
                  ButtonWidget(
                    onTap: () {
                      bool isValid = _formKey.currentState?.validate() ?? false;

                      if (isValid) _submit();
                    },
                    title: 'Verify',
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Resend"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
