import 'package:first_app/components/my_button.dart';
import 'package:first_app/components/my_textfield.dart';
import 'package:first_app/components/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign in user method
  void SignUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView( // This allows the content to scroll if it's too large
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                
                // Logo
                Icon(Icons.lock, size: 100),
                
                // Spacing
                SizedBox(height: 50),
                
                // Welcome message
                Text(
                  'Welcome back! You have been missed',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                
                // Spacing
                SizedBox(height: 26),
                
                // Username TextField
                MyTextfield(
                  controller: usernameController,
                  hintText: 'Username',
                  obsecureText: false,
                ),
                
                // Password TextField
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: true,
                ),
                
                // Spacing
                SizedBox(height: 50),
                
                // Forgot Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                
                // Spacing
                SizedBox(height: 50),
                
                // Sign In Button
                MyButton(
                  onTap: SignUserIn,
                ),
                
                // Spacing
                SizedBox(height: 50),
                
                // Or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Spacing
                SizedBox(height: 10),
                
                // Social Media Login Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagepath: 'lib/images/googlelogo.png'),
                    SizedBox(width: 10), // Space between Google and Apple logos
                    SquareTile(imagepath: 'lib/images/applelogo.png'),
                  ],
                ),
                
                // Spacing
                SizedBox(height: 10),
                
                // Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a Member?',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
