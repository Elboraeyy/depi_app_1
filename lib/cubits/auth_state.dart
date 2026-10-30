abstract class AuthState {}

class AuthInitial extends AuthState {}

///-------------Sign Up States-------------
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String msg;
  RegisterFailure(this.msg);
}

///-------------Sign In States-------------
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String msg;
  LoginFailure(this.msg);
}
