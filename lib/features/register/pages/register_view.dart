import 'package:althhimer_app/identify/pages/identify_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:althhimer_app/features/firebaseUtils.dart';
import 'package:althhimer_app/features/login/pages/login_view.dart';
import 'package:althhimer_app/services/snack_bar_service.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = "register";
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor:
              Colors.transparent, // Set to transparent to let the gradient show
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: mediaQuery.height * 0.15,
                      ),
                      Text(
                        "Create Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Full Name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          hintText: "Enter your Full Name",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 202, 204, 205)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 202, 204, 205),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your full name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Email",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 202, 204, 205)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 202, 204, 205),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Password",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 202, 204, 205)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              color: Color.fromARGB(255, 202, 204, 205),
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Confirm Password",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          hintText: "Enter your Confirm password",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 202, 204, 205)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              color: Color.fromARGB(255, 202, 204, 205),
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your confirm password";
                          }
                          if (value != passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            EasyLoading.show(status: 'Creating account...');
                            FirebaseUtils()
                                .createuserAccount(
                              emailController.text,
                              passwordController.text,
                            )
                                .then((value) {
                              EasyLoading.dismiss();
                              if (value) {
                                SnackBarService.showSuccessMessage(
                                    "Account successfully created");
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginView.routeName,
                                  (route) => false,
                                );
                              } else {
                                SnackBarService.showErrorMessage(
                                    "Account already exists for that email");
                              }
                            }).catchError((error) {
                              EasyLoading.dismiss();
                              SnackBarService.showErrorMessage(
                                  "An error occurred: $error");
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          minimumSize: Size(150, 50),
                          textStyle: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.kBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
