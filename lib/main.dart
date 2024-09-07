import 'package:althhimer_app/caregiver/user_type.dart';
import 'package:althhimer_app/config/application_theme_manager.dart';
import 'package:althhimer_app/features/home/pages/home_view.dart';
import 'package:althhimer_app/firebase_options.dart';
import 'package:althhimer_app/layout/layout_view.dart';
import 'package:althhimer_app/features/login/pages/login_view.dart';
import 'package:althhimer_app/features/register/pages/register_view.dart';
import 'package:althhimer_app/features/splash/pages/splash_view.dart';
import 'package:althhimer_app/services/loading_service.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'features/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:althhimer_app/careGiver/features/auth/login_care.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ApplicationThemeManager.lightTheme,
        themeMode: ThemeMode.light,
        initialRoute: SplashView.routeName,
        routes: {
          SplashView.routeName: (context) => const SplashView(),
          UserTypeSelectionPage.routeName: (context) =>
              const UserTypeSelectionPage(),
          LayoutView.routeName: (context) => const LayoutView(),
          LoginCareView.routeName: (context) => const LoginCareView(),
          LoginView.routeName: (context) => LoginView(),
          RegisterView.routeName: (context) => RegisterView(),
          HomeView.routeName: (context) => HomeView(),
        },
        navigatorObservers: [
          BotToastNavigatorObserver()
        ], //2. registered route observer
        builder: EasyLoading.init(
          builder: BotToastInit(),
        ),
      ),
    );
  }
}
