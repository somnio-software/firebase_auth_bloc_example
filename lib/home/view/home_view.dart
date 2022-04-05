import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => Home(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Welcome!'),
      ),
    );
  }
}
