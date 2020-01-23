import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_screen.dart';
import './bloc/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log Me In BLOC Pattern',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
