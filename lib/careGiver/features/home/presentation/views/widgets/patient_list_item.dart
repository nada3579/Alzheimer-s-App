import 'package:althhimer_app/caregiver/core/resources_manager/assets_manager/assets_manager.dart';
import 'package:flutter/material.dart';

class PatientListItem extends StatelessWidget {
  const PatientListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          color: const Color(0xff6C6B6B).withOpacity(.1),
          borderRadius: BorderRadius.circular(15)),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AssetsManager.steve),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Patient Name",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
        ],
      ),
    );
  }
}
