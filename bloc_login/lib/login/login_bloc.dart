import 'package:bloc/bloc.dart';
import 'package:register/login/login_event.dart';
import 'package:register/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<DoLoginEvent>((event, emit) async {
      print('Bloc: recebi um evento de login');

      emit(LoginLoadingState());

      await Future.delayed(const Duration(seconds: 2));

      if (event.email != 'wesley@gmail.com' || event.password != '123') {
        emit(LoginFailureState());
        return;
      }

      emit(LoginSuccessState());
    });

    on<DoSecurityCodeEvent>((event, emit) async {
      print('Bloc: recebi um evento de código de segurança');

      emit(SecurityCodeLoadingState());

      await Future.delayed(const Duration(seconds: 2));

      if (event.securyCode != '1234') {
        emit(SecurityCodeFailureState());
        return;
      }

      emit(SecurityCodeSuccessState());
    });
  }
}
