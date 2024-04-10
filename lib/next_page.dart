import 'package:flutter/material.dart';
import 'login_page.dart'; // Corrected import statement
import 'professor_profile_page.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[900],
        title: TextField(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          autofocus: false,
        ),
      ),
      body: Center(
        child: _searchQuery.isNotEmpty
            ? ProfessorProfilePage(
                name: _searchQuery,
                department: 'Department Name',
                email: 'professor@example.com',
                post: 'Professor',
              )
            : SizedBox(), // Show empty container if no search query
      ),
    );
  }
}
