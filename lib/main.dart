import 'package:firebase_auth_bloc_example/login/view/login_page.dart';
import 'package:auth_service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: RepositoryProvider(
        create: (context) => FirebaseAuthService(
          authService: FirebaseAuth.instance,
        ),
        child: LoginPage(),
      ),
    );
  }
}
