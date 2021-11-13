import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHiddenPass = false;
  bool _isHiddenConfirmPass = false;

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
      TextFormField(
        decoration: const InputDecoration(hintText: 'Full name'),
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
      TextFormField(
        decoration: const InputDecoration(hintText: 'Email Address'),
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
      TextFormField(
        decoration: const InputDecoration(hintText: 'Mobile Number'),
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
      TextFormField(
        decoration: const InputDecoration(hintText: 'Country'),
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
      TextFormField(
        obscureText: _isHiddenPass,
        controller: _passwordController,
        validator: (text) {
          if (text == null || text.length < 3) {
            return 'Invalid password';
          }
        },
        decoration: InputDecoration(
          hintText: 'Password',
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _isHiddenPass = !_isHiddenPass;
              });
            },
            child: Icon(
              _isHiddenPass ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        obscureText: _isHiddenConfirmPass,
        controller: _passwordConfirmationController,
        validator: (text) {
          if (text == null || text.length < 3) {
            return 'invalid password';
          }
        },
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _isHiddenConfirmPass = !_isHiddenConfirmPass;
              });
            },
            child: Icon(
              _isHiddenConfirmPass ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        decoration: const InputDecoration(hintText: 'Referal Code (Optional)'),
        controller: _referalCodeController,
      ),
      SizedBox(
        height: 24,
      ),
    ];
  }

  _register() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 34, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 48),
                  ...buildInputsForm(),
                  GestureDetector(
                    onTap: () {
                      bool isValid = _formKey.currentState?.validate() ?? false;

                      if (isValid) _register();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
