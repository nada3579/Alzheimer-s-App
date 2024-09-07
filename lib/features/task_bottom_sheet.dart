import 'package:althhimer_app/features/firebaseUtils.dart';
import 'package:althhimer_app/models/task_model.dart';
import 'package:althhimer_app/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../core/widget/custom_text_form_field.dart'; // Adjust the import as per your project structure
import 'package:provider/provider.dart';
import '../features/settings_provider.dart';
import 'package:intl/intl.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);

    return Container(
      width: mediaQuery.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add A New Task",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: titleController,
                maxLength: 20,
                maxLines: 1,
                hintText: "Enter your task title",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "You must enter the task title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: descriptionController,
                hintText: "Enter your task description",
                maxLength: 150,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "You must enter the task description";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text(
                "Select time",
                textAlign: TextAlign.start,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  vm.selectTaskDate(context);
                },
                child: Text(
                  DateFormat.yMMMMd().format(vm.selectedDate),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var data = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      isDone: false,
                      dateTime: vm.selectedDate,
                    );

                    EasyLoading.show();
                    FirebaseUtils().addANewTask(data).then((value) {
                      EasyLoading.dismiss();
                      Navigator.pop(context);
                      SnackBarService.showSuccessMessage(
                          "Task successfully created");
                    }).onError((error, stackTrace) {
                      EasyLoading.dismiss();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Add Task",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
