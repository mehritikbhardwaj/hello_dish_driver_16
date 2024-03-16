import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hello_dish_driver/screens/splash/spashScreen.dart';
import 'package:hello_dish_driver/utils/shared_pref..dart';
import 'package:hello_dish_driver/utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.shared.getPref(); //

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Container()),
    );
  };
  runApp(
    // DevicePreview(
    // builder: (context) =>
    MyApp(),
    //  enabled: false,
    // ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        //locale: DevicePreview.locale(context),
        debugShowCheckedModeBanner: false,
        locale: Locale(
          SharedPref.shared.pref?.getString(PrefKeys.appLanguage) ?? 'en',
          'IN',
        ),
        title: 'Hello Dish',
        theme: appTheme,
        home: SplashScreen(),
      ),
    );
  }
}

// test pushh nikunj