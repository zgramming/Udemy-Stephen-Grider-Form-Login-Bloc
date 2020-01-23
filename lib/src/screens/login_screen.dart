import 'package:flutter/material.dart';

import '../bloc/bloc.dart';
import '../bloc/provider.dart';

class LoginScreen extends StatelessWidget {
  // final bloc = Bloc();
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 25),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) => StreamBuilder(
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
  Widget passwordField(Bloc bloc) => StreamBuilder(
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

  Widget submitButton(Bloc bloc) => StreamBuilder(
        stream: bloc.submitValid,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print("${snapshot.hasData} : ${snapshot.hasError} ");
          return RaisedButton(
            onPressed: snapshot.hasData ? bloc.submit : null,
            textTheme: ButtonTextTheme.primary,
            color: Colors.blue,
            child: Text('Submit'),
          );
        },
      );
}
