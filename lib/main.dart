import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:imc/providers/clinic_provider.dart';
import 'package:imc/providers/doctor_provider.dart';
import 'package:imc/screens/bottomnavigationbar.dart';
import 'package:imc/screens/clinic_doctors_screen.dart';
import 'package:imc/screens/clinics_screen.dart';
import 'package:imc/screens/doctor_details_screen.dart';
import 'package:imc/themes.dart';
//import 'package:imc/themes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ClinicProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorProvider(),
        ),
      ],
      child: ThemeProvider(
        // initTheme: MyThemes.darkTheme,
        child: Builder(
          builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: MyThemes.lightTheme,
              title: 'international medical Center',
              home: BottomNavigationBarExample(),
              routes: {
                ClinicsScreen.routeName: (ctx) => ClinicsScreen(),
                ClinicDoctors.routeName: (ctx) => ClinicDoctors(),
                DoctorDetialsScreen.routeName: (ctx) => DoctorDetialsScreen(),
              }),
        ),
      ),
    );
  }
}
