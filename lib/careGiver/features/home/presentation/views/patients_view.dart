import 'package:althhimer_app/caregiver/features/home/presentation/views/activity_view.dart';
import 'package:flutter/material.dart';

import 'widgets/patient_list_item.dart';

class PatientsView extends StatelessWidget {
  const PatientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: const Text("Patients"),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ActivityView(),
              ),
            );
          },
          child: const PatientListItem(),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: 8,
      ),
    );
  }
}
