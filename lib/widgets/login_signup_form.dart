import 'package:flutter/material.dart';
import '../widgets/login_signup_form.dart'; // Correct the import path

class LoginSignupForm extends StatelessWidget {
  final bool isSignup;

  LoginSignupForm({required this.isSignup}); // Constructor to receive isSignup flag

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Displaying the appropriate text based on the 'isSignup' flag
        Text(isSignup ? 'Sign Up Form' : 'Login Form', style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        // Username field
        TextField(
          decoration: InputDecoration(labelText: 'Username'),
        ),
        SizedBox(height: 20),
        // Password field
        TextField(
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        // Conditional button text
        ElevatedButton(
          onPressed: () {},
          child: Text(isSignup ? 'Sign Up' : 'Login'),
        ),
      ],
    );
  }
}
