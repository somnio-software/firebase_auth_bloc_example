import 'package:firebase_auth_bloc_example/home/view/home_view.dart';
import 'package:firebase_auth_bloc_example/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.success) {
          Navigator.of(context).pushReplacement(Home.route());
        }
        if (state.status == SignupStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: const _SignupForm(),
    );
  }
}

class _SignupForm extends StatelessWidget {
  const _SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CreateAccountEmail(),
            const SizedBox(height: 30.0),
            _CreateAccountPassword(),
            const SizedBox(height: 30.0),
            _SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _CreateAccountEmail extends StatelessWidget {
  _CreateAccountEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: TextField(
        onChanged: (value) => context
            .read<SignupBloc>()
            .add(SignupEmailChangedEvent(email: value)),
        decoration: const InputDecoration(hintText: 'Email'),
      ),
    );
  }
}

class _CreateAccountPassword extends StatelessWidget {
  _CreateAccountPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: TextField(
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
        ),
        onChanged: (value) => context
            .read<SignupBloc>()
            .add(SignupPasswordChangedEvent(password: value)),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  _SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<SignupBloc>().add(
            SignupButtonPressedEvent(),
          ),
      child: const Text('Create Account'),
    );
  }
}
