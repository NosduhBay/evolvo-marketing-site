import 'package:flutter/material.dart';
import 'package:group7evolvo/pages/signup_page.dart';
import 'members_area.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  static const String freeTierMemberEmail = 'free_member@evolvo.com';
  static const String freeTierMemberPassword = 'free';
  static const String momentumMemberEmail = 'momentum_member@evolvo.com';
  static const String momentumMemberPassword = 'momentum';
  static const String ascendMemberEmail = 'ascend_member@evolvo.com';
  static const String ascendMemberPassword = 'ascend';
  static const String pinnacleMemberEmail = 'pinnacle_member@evolvo.com';
  static const String pinnacleMemberPassword = 'pinnacle';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set a clean white background
      appBar: AppBar(
        title: const Text('Ēvolvō - Member Access'),
        backgroundColor: Colors.white, // Use a strong color for the app bar
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Member Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Use a strong color for the button
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                onPressed: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  if ((email == LoginPage.freeTierMemberEmail && password == LoginPage.freeTierMemberPassword) ||
                      (email == LoginPage.momentumMemberEmail && password == LoginPage.momentumMemberPassword) ||
                      (email == LoginPage.ascendMemberEmail && password == LoginPage.ascendMemberPassword) ||
                      (email == LoginPage.pinnacleMemberEmail && password == LoginPage.pinnacleMemberPassword)) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MembersArea(email: email)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid email or password')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent, // Use a strong color for the text
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}