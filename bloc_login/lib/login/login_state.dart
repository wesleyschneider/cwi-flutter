abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {}

class LoginLoadingState extends LoginState {}

class SecurityCodeSuccessState extends LoginState {}

class SecurityCodeFailureState extends LoginState {}

class SecurityCodeLoadingState extends LoginState {}
