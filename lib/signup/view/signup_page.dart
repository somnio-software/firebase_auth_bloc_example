import 'package:firebase_auth_bloc_example/signup/bloc/signup_bloc.dart';
import 'package:firebase_auth_bloc_example/signup/view/signup_view.dart';
import 'package:auth_service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(
        authService: context.read<FirebaseAuthService>(),
      ),
      child: SignUpView(),
    );
  }
}
