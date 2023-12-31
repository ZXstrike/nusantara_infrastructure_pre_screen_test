import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/services/auth_services.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/auth_models/login_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/utils/constant/sp_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = true;

  bool isLoading = false;

  late BuildContext context;

  void visibilityToggle() {
    isVisible = !isVisible;
    update();
  }

  void login() async {
    if (!isLoading) {
      if (formKey.currentState!.validate()) {
        isLoading = true;
        update();
        SharedPreferences sp = await SharedPreferences.getInstance();
        if (true) {
          final LoginData? data = await AuthServices.login(
              email: emailController.text, password: passwordController.text);
          if (data != null) {
            sp.setString(SPKey.token, data.token);
            passwordController.clear();
            emailController.clear();
            goToHome();
          }
        }
        isLoading = false;
        update();
      }
    }
  }

  void goToHome() {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  String? validateEmail(value) {
    return value!.isEmpty
        ? 'Enter Your Email'
        : !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)
            ? 'Enter a Valid Email'
            : null;
  }

  String? validatePass(value) {
    return value!.isEmpty ? 'Enter Your Password' : null;
  }

  void goToRegister() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/register',
      (route) => false,
    );
  }
}
