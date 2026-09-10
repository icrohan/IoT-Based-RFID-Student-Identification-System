import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SubjectDetailsScreen extends StatefulWidget {
  final String studentid;
  final String subject;

  SubjectDetailsScreen({required this.studentid, required this.subject});

  @override
  _SubjectDetailsScreenState createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
  List<Map<String, String>> _subjectDetails = [];
  String _error = '';

  Future<void> fetchSubjectDetails() async {
    try {
      final response = await http.get(
        Uri.parse('https://rf-ijcj.onrender.com/attendance/subject/${widget.subject}?rfid_id=${widget.studentid}'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          _subjectDetails = jsonData.map((item) {
            if (item is Map<String, dynamic>) {
              return Map<String, String>.from(item);
            } else {
              throw FormatException('Unexpected JSON format');
            }
          }).toList();
          _error = '';
        });
      } else {
        setState(() {
          _error = 'Error fetching subject details: ${response.statusCode} ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error fetching subject details: ${e.toString()}';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSubjectDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.subject} Details',
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _error.isNotEmpty
                ? Center(
                    child: Text(
                      _error,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  )
                : _subjectDetails.isEmpty
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
                                  'Date',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Center(
                                child: Text(
                                  'Time',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Center(
                                child: Text(
                                  'Status',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                          rows: _subjectDetails.map((detail) {
                            return DataRow(cells: [
                              DataCell(Center(
                                child: Text(
                                  detail['date'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  detail['time'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                              DataCell(Center(
                                child: Text(
                                  detail['status'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                            ]);
                          }).toList(),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
