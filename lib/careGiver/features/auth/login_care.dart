import 'package:althhimer_app/caregiver/core/core_widgets/default_button.dart';
import 'package:althhimer_app/caregiver/core/core_widgets/default_form_field.dart';
import 'package:althhimer_app/caregiver/core/resources_manager/assets_manager/assets_manager.dart';
import 'package:althhimer_app/caregiver/features/home/presentation/views/patients_view.dart';
import 'package:flutter/material.dart';
import 'package:althhimer_app/caregiver/user_type.dart';

import 'register_view.dart';

class LoginCareView extends StatelessWidget {
  static const String routeName = "LoginCareView";
  const LoginCareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Image.asset(
                  AssetsManager.singIn,
                  width: 300,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Please Sign in to continue",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultFormField(
                controller: TextEditingController(),
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultFormField(
                controller: TextEditingController(),
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: const Icon(Icons.visibility_off),
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultButton(
                text: "Login",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PatientsView(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
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
}
