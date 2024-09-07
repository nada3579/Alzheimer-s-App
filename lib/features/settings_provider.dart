import 'package:flutter/material.dart';
import 'package:althhimer_app/features/today/pages/today_view.dart';

class SettingsProvider extends ChangeNotifier {
  List<Widget> screens = [
    TodayView(),
  ];

  int currentIndex = 0;
  ThemeMode currentTheme = ThemeMode.light;
  DateTime selectedDate = DateTime.now();

  Future<void> selectTaskDate(BuildContext context) async {
    var currentSelectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      currentDate: DateTime.now(),
      initialDate: selectedDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (currentSelectedDate != null) {
      selectedDate = currentSelectedDate;
      notifyListeners();
    }
  }

  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}
