import 'package:flutter/material.dart';

class ProfessorProfilePage extends StatelessWidget {
  final String name;
  final String department;
  final String email;
  final String post;

  // Constructor to initialize the professor's details
  ProfessorProfilePage({
    required this.name,
    required this.department,
    required this.email,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professor Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 75,
              backgroundImage:
                  AssetImage('assets/professor_image.jpg'), // Placeholder image
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Department: $department',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Post: $post',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: $email',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
