import 'package:flatmate_app/auth/presentation/login_screen.dart';
import 'package:flatmate_app/main_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showEmailInput = false;
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top text and image
                Text(
                  'Your new Cró is waiting!',
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

                // Here show the email input only if showEmailInput is true
                if (showEmailInput)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),

                // Buttons
                Column(
                  spacing: 20,
                  children: [
                    _LoginButton(
                      label: 'Continue with Mail',
                      backgroundColor: Colors.grey[400]!,
                      onPressed: () {
                        setState(() {
                          showEmailInput = !showEmailInput;
                        });
                      },
                    ),
                    _LoginButton(
                      label: 'Continue with Instagram',
                      backgroundColor: Color(0xFFC13584), 
                      onPressed: () {
                        // TODO: Instagram login action
                      },
                    ),
                    _LoginButton(
                      label: 'Continue with Google',
                      backgroundColor: Color(0xFFDB4437),
                      onPressed: () {
                        // TODO: Google login action
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainBody()),
                        );
                      },
                    ),
                  ],
                ),
          
                // Footer text with clickable Log in link
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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