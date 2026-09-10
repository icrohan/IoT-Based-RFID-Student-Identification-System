import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewAttendanceScreen extends StatefulWidget {
  @override
  _ViewAttendanceScreenState createState() => _ViewAttendanceScreenState();
}

class _ViewAttendanceScreenState extends State<ViewAttendanceScreen> {
  List<dynamic> attendanceData = [];
  final ScrollController _scrollController = ScrollController();

  Future<void> fetchAttendance() async {
    try {
      final response = await http.get(
        Uri.parse('https://rf-ijcj.onrender.com/admin/attendance-summary'),
      );

      if (response.statusCode == 200) {
        setState(() {
          attendanceData = json.decode(response.body);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to fetch attendance data')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to fetch attendance data')));
    }
  }

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    fetchAttendance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Attendance Summary',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
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
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: DataTable(
                    columnSpacing: 10,
                    columns: [
                      DataColumn(label: Text(
                        'Student ID',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(label: Text(
                        'Subject',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(label: Text(
                        'Total Classes',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(label: Text(
                        'Present',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(label: Text(
                        'Absent',
                        style: TextStyle(color: Colors.white),
                      )),
                      DataColumn(label: Text(
                        'Percentage',
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                    rows: attendanceData.map((attendance) {
                      return DataRow(cells: [
                        DataCell(Text(
                          attendance['studentid'].toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        DataCell(Text(
                          attendance['subject'].toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        DataCell(Text(
                          attendance['classes_conducted'].toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        DataCell(Text(
                          attendance['classes_present'].toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        DataCell(Text(
                          attendance['classes_absent'].toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        DataCell(Text(
                          attendance['percentage'].toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
