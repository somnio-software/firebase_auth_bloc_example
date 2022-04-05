part of 'login_bloc.dart';

enum LoginStatus {
  success,
  failure,
  loading,
}

class LoginState extends Equatable {
  const LoginState({
    this.message = '',
    this.status = LoginStatus.loading,
    this.email = '',
    this.password = '',
  });

  final String message;
  final LoginStatus status;
  final String email;
  final String password;

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        email,
        password,
      ];
}
