import 'dart:io';
import 'package:althhimer_app/identify/pages/id.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class Constants {
  static const Color kBlue = Color(0xFF669197);
  static const Color kwhite = Color(0xFFe9ecef);
  static const IconData people = IconData(0xe486, fontFamily: 'MaterialIcons');
}

class IdentifyScreen extends StatefulWidget {
  @override
  _IdentifyScreenState createState() => _IdentifyScreenState();
}

class _IdentifyScreenState extends State<IdentifyScreen> {
  String? identifiedPersonName;
  double? confidence;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6e9fa4),
        title: Text(
          'Identify',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Constants.people, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Identifyview()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(
                  0xFF005056), // Adjust these colors to match the gradient in your image
              Color(0xFF8b7a7f),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedImage == null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No image selected",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.kwhite,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: pickImage,
                      icon: Icon(Icons.image_search,
                          size: 30, color: Constants.kBlue),
                      label: Text(
                        'Upload Photo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.kBlue,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        minimumSize: Size(350, 60),
                        textStyle: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              if (selectedImage != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.file(
                      selectedImage!,
                      width: 300,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    if (identifiedPersonName != null)
                      Column(
                        children: [
                          Text(
                            'Person identified: $identifiedPersonName',
                            style: TextStyle(
                                color: Constants.kwhite, fontSize: 26.0),
                          ),
                          Text(
                            'Confidence: ${(confidence! * 100).toStringAsFixed(2)}%',
                            style: TextStyle(
                                color: Constants.kwhite, fontSize: 26.0),
                          ),
                        ],
                      )
                    else
                      Text(
                        "Can't identify",
                        style:
                            TextStyle(color: Constants.kwhite, fontSize: 26.0),
                      ),
                    SizedBox(height: 2),
                    ElevatedButton.icon(
                      onPressed: pickImage,
                      icon: Icon(Icons.image_search,
                          size: 30, color: Constants.kBlue),
                      label: Text(
                        'Upload Another Photo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.kBlue,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        minimumSize: Size(200, 60),
                        textStyle: TextStyle(fontSize: 26),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        identifiedPersonName = null;
        confidence = null;
      });
      await identifyPerson(selectedImage!);
    }
  }

  Future<void> identifyPerson(File imageFile) async {
    final response = await uploadImage(imageFile);
    if (response != null) {
      setState(() {
        identifiedPersonName = response['prediction'];
        confidence = response['confidence'];
      });
    }
  }

  Future<Map<String, dynamic>?> uploadImage(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
      });
      final response = await Dio().post(
        'https://5c6d-154-128-151-241.ngrok-free.app/predictApi?',
        data: formData,
      );
      if (response.statusCode == 200) {
        print('Server response: ${response.data}');
        return response.data;
      } else {
        print('Failed to identify person. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error identifying person: $e');
      return null;
    }
  }
}

class IdentifyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identify View'),
        backgroundColor: Constants.kBlue,
      ),
      body: Center(
        child: Text('This is the Identify View screen'),
      ),
    );
  }
}
