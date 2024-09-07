import 'package:althhimer_app/caregiver/core/core_widgets/default_button.dart';
import 'package:althhimer_app/caregiver/core/core_widgets/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'done_view.dart';

class MedicineView extends StatefulWidget {
  const MedicineView({super.key});

  @override
  State<MedicineView> createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  DateTime? selectedDate;
  var dateController = TextEditingController();
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
        title: const Text("Add Medicine"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultFormField(
                  controller: TextEditingController(),
                  hintText: "Medicine Name",
                  prefixIcon: const Icon(Icons.local_activity_outlined),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultFormField(
                  controller: dateController,
                  hintText: "Medicine Date",
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.calendar_today,
                      color: Colors.blue,
                    ),
                    onPressed: presentDatePicker,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultFormField(
                  controller: TextEditingController(),
                  hintText: "Medicine Time",
                  prefixIcon: const Icon(Icons.access_time),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultFormField(
                  controller: TextEditingController(),
                  hintText: "Medicine Note",
                  prefixIcon: const Icon(Icons.note_alt_outlined),
                ),
                const SizedBox(
                  height: 50,
                ),
                DefaultButton(
                  text: "Done",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DoneView();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(3030))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
        dateController.text =
            DateFormat('yyyy-MM-dd – kk:mm').format(selectedDate!);
      });
    });
  }
}
