import 'package:althhimer_app/caregiver/core/resources_manager/assets_manager/assets_manager.dart';
import 'package:flutter/material.dart';

class DoneView extends StatelessWidget {
  const DoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Image.asset(
          AssetsManager.done,
          width: 300,
          height: 250,
        ),
      ),
    );
  }
}
