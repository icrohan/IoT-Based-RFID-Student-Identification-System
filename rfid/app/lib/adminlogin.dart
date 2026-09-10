import 'dart:convert';
import 'package:flutter/material.dart';
import 'adminpage.dart';
import 'package:http/http.dart' as http;

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController _adminIdController = TextEditingController();
  final TextEditingController _adminPasswordController = TextEditingController();
  String _error = '';

  Future<void> adminLogin() async {
    try {
      final response = await http.post(
        Uri.parse('https://rf-ijcj.onrender.com/admin/login'),
        body: json.encode({
          'adminid': _adminIdController.text,
          'password': _adminPasswordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminDashboardScreen(),
          ),
        );
      } else {
        setState(() {
          _error = 'Invalid admin ID or password';
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
        centerTitle: true, // Aligns the title to the center
        title: Text(
          'Admin Login',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255,  32, 32, 35),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 0, 0, 0), const Color.fromARGB(255, 72, 74, 74)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               
                SizedBox(height: 20),
                SizedBox(width: 400,
                child: 
                TextField(
                  controller: _adminIdController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Admin ID',
                    labelStyle: TextStyle(color: Colors.white),
                   border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black), // Focused border color changed to black
                      ),
                  ),
                ),
                ),
                SizedBox(height: 20),
                SizedBox(width: 400,
                child: 
                TextField(
                  controller: _adminPasswordController,
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
                        borderSide: BorderSide(color: Colors.black), // Focused border color changed to black
                      ),
                  ),
                  obscureText: true,
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
                  onPressed: adminLogin,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 6, 6)),
                  ),
                ),
                if (_error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      _error,
                      style: TextStyle(color: const Color.fromARGB(255, 250, 12, 12), fontSize: 14),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
