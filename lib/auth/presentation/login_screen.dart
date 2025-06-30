import 'package:flatmate_app/auth/presentation/register_screen.dart';
import 'package:flatmate_app/main_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top text and image
                Text(
                  'Nice to see you again!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                Image.asset(
                  'assets/people/celebration_2.avif',
                  height: 180,
                  fit: BoxFit.contain,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                    ],
                  ),
                ),

                

                // Log In button
                _LoginButton(
                  label: 'Log in',
                  backgroundColor: Colors.blue[700]!,
                  onPressed: () {
                    // TODO: Add log in logic
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainBody()),
                    );
                  },
                ),

                // Forgot password link
                GestureDetector(
                  onTap: () {
                    // TODO: Forgot password action
                  },
                  child: Text(
                    'Forgotten Password?',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Facebook and Google buttons
                Column(
                  children: [
                    _LoginButton(
                      label: 'Continue with Instagram',
                      backgroundColor: Color(0xFFC13584), // Instagram magenta/purple-ish
                      onPressed: () {
                        // TODO: Instagram login action
                      },
                    ),
                    const SizedBox(height: 10),
                    _LoginButton(
                      label: 'Google',
                      backgroundColor: Color(0xFFDB4437),
                      onPressed: () {
                        // TODO: Google login
                      },
                    ),
                  ],
                ),

                // Sign up link
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const _LoginButton({
    required this.label,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}