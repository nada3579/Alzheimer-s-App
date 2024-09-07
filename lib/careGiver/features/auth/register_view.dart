import 'package:althhimer_app/caregiver/core/core_widgets/default_button.dart';
import 'package:althhimer_app/caregiver/core/core_widgets/default_form_field.dart';
import 'package:althhimer_app/caregiver/core/resources_manager/assets_manager/assets_manager.dart';
import 'package:althhimer_app/careGiver/features/auth/login_care.dart';
import 'package:althhimer_app/caregiver/features/home/presentation/views/patients_view.dart';

import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 50,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AssetsManager.singUp,
                  width: 300,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Please register to login",
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
                hintText: "Username",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person_outline),
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
                text: "Sign Up",
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
                    "Already have an account?",
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
                            builder: (context) => const LoginCareView(),
                          ));
                    },
                    child: const Text(
                      "Sign In",
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
