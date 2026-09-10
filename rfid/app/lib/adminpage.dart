import 'package:flutter/material.dart';
import 'admin_addst.dart';
import 'admin_stcred.dart';
import 'admin_viewad.dart';
import 'uploadtime.dart';

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 32, 32, 35),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add Student Button
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 246, 244, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminPanel()),
                      );
                    },
                    icon: Icon(Icons.person_add, color: const Color.fromARGB(255, 8, 6, 6)),
                    label: Text(
                      'Add Student',
                      style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 6, 6)),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // View Attendance Button
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 246, 244, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewAttendanceScreen()),
                      );
                    },
                    icon: Icon(Icons.visibility, color: const Color.fromARGB(255, 8, 6, 6)),
                    label: Text(
                      'View Attendance',
                      style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 6, 6)),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Add Credentials Button
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 246, 244, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCredentialsScreen()),
                      );
                    },
                    icon: Icon(Icons.key, color: const Color.fromARGB(255, 8, 6, 6)),
                    label: Text(
                      'Add Credentials',
                      style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 6, 6)),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Update Timetable Button
                SizedBox(
                  width: 300,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 246, 244, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UploadTimetableScreen()),
                      );
                    },
                    icon: Icon(Icons.upload_file, color: const Color.fromARGB(255, 8, 6, 6)),
                    label: Text(
                      'Update Timetable',
                      style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 6, 6)),
                    ),
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
