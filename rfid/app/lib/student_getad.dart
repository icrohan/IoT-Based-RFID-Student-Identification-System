import 'package:flutter/material.dart';
import 'student_addet.dart';

class AttendanceScreen extends StatefulWidget {
  final String studentid;

  AttendanceScreen({required this.studentid});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  Future<void> navigateToAttendanceDetails() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AttendanceDetailsScreen(studentid: widget.studentid),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Attendance Records',
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
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: const Color.fromARGB(255, 246, 244, 244),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
            ),
            onPressed: navigateToAttendanceDetails,
            child: Text(
              'Get Attendance',
              style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 6, 6)),
            ),
          ),
        ),
      ),
    );
  }
}


