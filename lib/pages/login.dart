import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Login Page',
        style: TextStyle(
          fontSize: 55,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
