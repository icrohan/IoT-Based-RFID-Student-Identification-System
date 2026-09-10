import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' as Foundation;

class UploadTimetableScreen extends StatefulWidget {
  @override
  _UploadTimetableScreenState createState() => _UploadTimetableScreenState();
}

class _UploadTimetableScreenState extends State<UploadTimetableScreen> {
  String? fileName;

  Future<void> uploadExcelFile() async {
    // Pick the file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });

      // Web-specific logic for picking file
      if (Foundation.kIsWeb) {
        // Access the bytes instead of the path
        Uint8List bytes = result.files.single.bytes!;
        await _uploadFile(bytes, result.files.single.name);
      } else {
        // Use path for mobile or desktop platforms
        File file = File(result.files.single.path!);
        await _uploadFile(file.readAsBytesSync(), result.files.single.name);
      }
    } else {
      print('No file selected');
    }
  }

  Future<void> _uploadFile(Uint8List fileBytes, String fileName) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://rf-ijcj.onrender.com/upload-timetable'),
    );

    // Create a MultipartFile from the bytes
    var multipartFile = http.MultipartFile.fromBytes(
      'file', fileBytes,
      filename: fileName,
    );
    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Timetable updated successfully');
    } else {
      print('Failed to update timetable');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Timetable',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 32, 32, 35),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (fileName != null) ...[
              Text(
                'Selected File: $fileName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
            ],
            ElevatedButton(
              onPressed: uploadExcelFile,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: const Color.fromARGB(255, 246, 244, 244),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
              ),
              child: Text(
                'Upload Timetable',
                style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 8, 6, 6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
