part of 'signup_bloc.dart';

enum SignupStatus {
  success,
  failure,
  loading,
}

class SignupState extends Equatable {
  SignupState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.status = SignupStatus.loading,
  });

  final String message;
  final SignupStatus status;
  final String email;
  final String password;

  SignupState copyWith({
    String? email,
    String? password,
    SignupStatus? status,
    String? message,
  }) {
    return SignupState(
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
