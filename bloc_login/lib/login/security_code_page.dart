import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/home/home_page.dart';
import 'package:register/login/login_bloc.dart';
import 'package:register/login/login_event.dart';
import 'package:register/login/login_state.dart';

class SecurityCodePage extends StatefulWidget {
  static const route = 'security-code';

  const SecurityCodePage({Key? key}) : super(key: key);

  @override
  _SecurityCodePageState createState() => _SecurityCodePageState();
}

class _SecurityCodePageState extends State<SecurityCodePage> {
  final formKey = GlobalKey<FormState>();

  List<String> code = ['0', '0', '0', '0'];

  final nodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  late LoginBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (_, state) {
        if (state is SecurityCodeFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Código de segurança inválido'),
            ),
          );
        }

        if (state is SecurityCodeSuccessState) {
          Navigator.of(context).pushNamed(HomePage.route);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Verification',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'a four digit verification code has been sent to your mobile number',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 40),
                buildCodeField(),
                const SizedBox(height: 79),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: BlocBuilder(
                      bloc: bloc,
                      builder: (_, state) => state is SecurityCodeLoadingState
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Verify',
                            ),
                    ),
                    onPressed: onVerifyPressed,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  child: const Text('Resend'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildSingleDigitField(int index, {isLast = false, isFirst = false}) =>
      SizedBox(
        width: 45,
        child: TextFormField(
          autofocus: isFirst,
          focusNode: nodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          onSaved: (text) {
            code[index] = text ?? '0';
          },
          validator: (text) => (text?.trim().length ?? 0) == 1 ? null : '',
          onChanged: (_) {
            if (!isLast) nodes[index + 1].requestFocus();
          },
          onFieldSubmitted: isLast
              ? (_) {
                  onVerifyPressed();
                }
              : null,
        ),
      );

  buildSpacer() => const SizedBox(width: 11);

  Widget buildCodeField() => Row(
        children: [
          buildSingleDigitField(0, isFirst: true),
          buildSpacer(),
          buildSingleDigitField(1),
          buildSpacer(),
          buildSingleDigitField(2),
          buildSpacer(),
          buildSingleDigitField(3, isLast: true),
        ],
      );

  onVerifyPressed() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      bloc.add(
        DoSecurityCodeEvent(
          securyCode: code.join(''),
        ),
      );
    }
  }
}
