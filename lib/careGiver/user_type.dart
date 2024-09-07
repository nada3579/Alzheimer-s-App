import 'package:althhimer_app/identify/pages/identify_view.dart';
import 'package:flutter/material.dart';
import 'package:althhimer_app/features/login/pages/login_view.dart';
import 'package:althhimer_app/caregiver/features/auth/login_care.dart';

class UserTypeSelectionPage extends StatelessWidget {
  static const String routeName = "UserTypeSelectionPage";

  const UserTypeSelectionPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/logo2.jpeg",
                      width: 172,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Tell us who you are!',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 40.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    minimumSize: Size(150, 50),
                    textStyle: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I'm a patient",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Constants.kBlue, // يمكنك استخدام لونك المفضل هنا
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    minimumSize: Size(150, 50),
                    textStyle: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginCareView()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I'm a caregiver",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Constants.kBlue, // يمكنك استخدام لونك المفضل هنا
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "I really don't know",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
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
