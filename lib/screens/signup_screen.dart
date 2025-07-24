import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final String backgroundImageUrl =
      'https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=1050&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(backgroundImageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 60),

              // Text section (title)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Create your account 👋",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Form container
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 50),

                      // Google Sign-In Button
                      GestureDetector(
                        onTap: () {
                          // Handle Google Sign-In logic here
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]!),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: const Offset(0, 5),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'data:image/jpeg;base64,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',
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Sign Up with Google",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Full Name input
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your full name",
                          labelText: "Full Name",
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 97, 97, 97)),
                          filled: true,
                          fillColor: Colors.grey[100],
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFFF1F8F), width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Email input
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 97, 97, 97)),
                          filled: true,
                          fillColor: Colors.grey[100],
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFFF1F8F), width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Password input
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          filled: true,
                          fillColor: Colors.grey[100],
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFFF1F8F), width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Sign Up Button (normal)
                      GestureDetector(
                        onTap: () {
                          // Handle normal sign up logic here
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFFFF1F8F),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: const Offset(0, 5),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
