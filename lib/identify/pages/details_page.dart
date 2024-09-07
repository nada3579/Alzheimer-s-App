import 'package:althhimer_app/identify/pages/identify_view.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String details;

  DetailsPage({
    required this.imagePath,
    required this.name,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.kBlue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF005056),
              Color(0xFF8b7a7f),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: imagePath.contains('assets')
                        ? AssetImage(imagePath)
                        : FileImage(File(imagePath)) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 105, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      details,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
