import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'student_subad.dart';

class AttendanceDetailsScreen extends StatefulWidget {
  final String studentid;

  AttendanceDetailsScreen({required this.studentid});

  @override
  _AttendanceDetailsScreenState createState() => _AttendanceDetailsScreenState();
}

class _AttendanceDetailsScreenState extends State<AttendanceDetailsScreen> {
  List<dynamic> _attendanceRecords = [];
  String _error = '';

  Future<void> fetchAttendance() async {
    try {
      final response = await http.get(
        Uri.parse('https://rf-ijcj.onrender.com/attendance?rfid_id=${widget.studentid}'),
      );

      if (response.statusCode == 200) {
        setState(() {
          _attendanceRecords = json.decode(response.body);
          _error = '';
        });
      } else {
        setState(() {
          _error = 'Error fetching attendance';
          _attendanceRecords = [];
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error fetching attendance';
        _attendanceRecords = [];
      });
    }
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
          'Attendance Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 32, 35),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Center( // Center the table
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _error.isNotEmpty
                ? Center(
                    child: Text(
                      _error,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  )
                : _attendanceRecords.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.all(Colors.grey[800]),
                          columns: [
                            DataColumn(
                              label: Center(
                                child: Text(
                                  'Subject',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Center(
                                child: Text(
                                  'Classes Conducted',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Center(
                                child: Text(
                                  'Classes Present',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Center(
                                child: Text(
                                  'Classes Absent',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Center(
                                child: Text(
                                  'Percentage',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Center(
                                child: Text(
                                  'Details',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                          rows: _attendanceRecords.map((record) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text(
                                    record['subject'] ?? '',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    record['classes_conducted'].toString(),
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    record['classes_present'].toString(),
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    record['classes_absent'].toString(),
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    record['percentage'].toString(),
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                                DataCell(Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      backgroundColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 4,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SubjectDetailsScreen(
                                            subject: record['subject'],
                                            studentid: widget.studentid,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Details',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
