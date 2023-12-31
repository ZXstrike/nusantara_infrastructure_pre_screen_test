import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/bool_list_by_user_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/screens/book_form_screen/add_book_screen.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/screens/book_form_screen/edit_book_screen.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/screens/home_screen/home_screen.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/screens/login_screen/login_screen.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/screens/profile_screen/profile_screen.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/screens/register_screen/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            );
          case '/register':
            return MaterialPageRoute(
              builder: (context) => const RegisterScreen(),
            );
          case '/home':
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );
          case '/profile':
            return MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            );
          case '/addbook':
            return MaterialPageRoute(
              builder: (context) => const AddBookScreen(),
            );
          case '/editbook':
            return MaterialPageRoute(
              builder: (context) {
                final args = (settings.arguments) as Datum;
                return EditBookScreen(data: args);
              },
            );
        }
        return null;
      },
    );
  }
}
