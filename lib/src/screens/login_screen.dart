import 'package:flutter/material.dart';

import '../bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  final bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          SizedBox(height: 25),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() => StreamBuilder(
        stream: bloc.email,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "you@example.com",
              labelText: "Email Address",
              errorText: snapshot.error,
            ),
          );
        },
      );
  Widget passwordField() => StreamBuilder(
        stream: bloc.password,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
          );
        },
      );

  Widget submitButton() => RaisedButton(
        onPressed: () => "",
        textTheme: ButtonTextTheme.primary,
        color: Colors.blue,
        child: Text('Submit'),
      );
}
