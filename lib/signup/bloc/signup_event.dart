part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object?> get props => [];
}

class SignupButtonPressedEvent extends SignupEvent {
  const SignupButtonPressedEvent();
}

class SignupEmailChangedEvent extends SignupEvent {
  SignupEmailChangedEvent({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class SignupPasswordChangedEvent extends SignupEvent {
  SignupPasswordChangedEvent({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}
