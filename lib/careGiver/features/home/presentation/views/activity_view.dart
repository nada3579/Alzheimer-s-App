import 'package:althhimer_app/caregiver/core/core_widgets/default_button.dart';
import 'package:althhimer_app/caregiver/core/core_widgets/default_form_field.dart';
import 'package:althhimer_app/caregiver/features/home/presentation/views/medicine_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
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
        title: const Text("Add Activity"),
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
                  hintText: "Activity Name",
                  prefixIcon: const Icon(Icons.local_activity_outlined),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultFormField(
                  controller: dateController,
                  hintText: "Activity Date",
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
                  hintText: "Activity Time",
                  prefixIcon: const Icon(Icons.access_time),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultFormField(
                  controller: TextEditingController(),
                  hintText: "Activity Note",
                  prefixIcon: const Icon(Icons.note_alt_outlined),
                ),
                const SizedBox(
                  height: 50,
                ),
                DefaultButton(
                  text: "Next",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MedicineView()));
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
