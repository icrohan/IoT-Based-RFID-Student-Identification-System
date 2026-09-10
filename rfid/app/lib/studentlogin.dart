
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'adminpage.dart';
import 'student_getad.dart';

extension StringCapitalization on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

class LoginScreen extends StatefulWidget {
  final String userType;

  LoginScreen({required this.userType});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = '';

  // Login function
  Future<void> login() async {
    try {
      final response = await http.post(
        Uri.parse('https://rf-ijcj.onrender.com/login'),
        body: json.encode({
          'studentid': _studentIdController.text,
          'password': _passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String studentid = data['studentid'];

        if (widget.userType == 'admin') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminDashboardScreen(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AttendanceScreen(studentid: studentid),
            ),
          );
        }
      } else {
        setState(() {
          _error = 'Invalid student ID or password';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Login failed. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.userType.capitalize()} Login',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 32, 35),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 0, 0, 0),
              const Color.fromARGB(255, 72, 74, 74),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: _studentIdController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Student ID',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 400,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 246, 244, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                    ),
                    onPressed: login,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 6, 6)),
                    ),
                  ),
                  SizedBox(height: 10),
                  if (_error.isNotEmpty)
                    Text(
                      _error,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 250, 12, 12),
                        fontSize: 14,
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
