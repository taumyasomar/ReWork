import 'package:flutter/material.dart';
import 'next_page.dart'; // Import the next page to navigate to

class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  final _formKey = GlobalKey<FormState>(); // Key for the form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[900], // Set background color
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/VIT.png',
                    width: 150.0,
                    height: 150.0,
                  ), // Load your image
                  SizedBox(height: 20),
                  Form(
                    key: _formKey, // Assign the form key
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your VIT email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // Change border color
                            ),
                          ),
                          style: TextStyle(color: Colors.black), // Text color
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.endsWith('@vitstudent.ac.in')) {
                              return 'Please enter a valid VIT student email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // Change border color
                            ),
                          ),
                          style: TextStyle(color: Colors.black), // Text color
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NextPage()),
                              );
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.deepPurpleAccent, // Text color
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white, // Button background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
