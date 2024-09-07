import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:althhimer_app/account/pages/medical_stuts.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  File? _image;
  final TextEditingController _nameController =
      TextEditingController(text: 'Henry Cavill');

  final TextEditingController _ageController =
      TextEditingController(text: '85 year old');
  final TextEditingController _bloodTypeController =
      TextEditingController(text: 'AB');
  final TextEditingController _heightController =
      TextEditingController(text: '180 cm');
  final TextEditingController _weightController =
      TextEditingController(text: '64 kg');

  bool _isEditing = false;

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF6e9fa4),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _isEditing
                              ? TextFormField(
                                  controller: _nameController,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                )
                              : Text(
                                  _nameController.text,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                        ),
                        const SizedBox(width: 30),
                        GestureDetector(
                          onTap: getImage,
                          child: CircleAvatar(
                            radius: 43,
                            backgroundColor: Colors.white,
                            child: _image != null
                                ? CircleAvatar(
                                    radius: 40,
                                    backgroundImage: FileImage(_image!),
                                  )
                                : const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                        'assets/persons/patient.jpg'),
                                  ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(_isEditing ? Icons.save : Icons.edit,
                              color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _isEditing = !_isEditing;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        infoCard('AGE', _ageController, Icons.cake),
                        infoCard(
                            'BLOOD', _bloodTypeController, Icons.bloodtype),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        infoCard('HEIGHT', _heightController, Icons.height),
                        infoCard(
                            'WEIGHT', _weightController, Icons.monitor_weight),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              medicalSlotButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(
      String title, TextEditingController controller, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF4DB08A)),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 5),
            _isEditing
                ? TextFormField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  )
                : Text(
                    controller.text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget optionCard(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF6e9fa4)),
        title: Text(title),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
        onTap: () {},
      ),
    );
  }

  Widget medicalSlotButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.schedule, color: Color(0xFF6e9fa4)),
        title: const Text('Medical Status'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MedicalStatusPage()),
          );
        },
      ),
    );
  }
}
