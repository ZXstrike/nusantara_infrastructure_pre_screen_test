import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/services/auth_services.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/auth_models/login_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/auth_models/register_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/utils/constant/sp_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  bool isVisible = true;

  bool isLoading = false;

  late BuildContext context;

  void visibilityToggle() {
    isVisible = !isVisible;
    update();
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      SharedPreferences sp = await SharedPreferences.getInstance();
      if (true) {
        final RegisterData? regData = await AuthServices.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController1.text,
          passwordConfirmation: passwordController2.text,
        );
        if (regData != null) {
          final LoginData? data = await AuthServices.login(
              email: emailController.text, password: passwordController1.text);
          if (data != null) {
            sp.setString(SPKey.token, data.token);
            nameController.clear();
            emailController.clear();
            passwordController1.clear();
            passwordController2.clear();
            goToHome();
          }
        }
      }
      isLoading = false;
      update();
    }
  }

  void goToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
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

  String? validateName(value) {
    return value!.isEmpty ? 'Enter Your Username' : null;
  }

  String? validatePass1(value) {
    return value!.isEmpty
        ? 'Enter Your Password'
        : value.toString().length < 8
            ? 'Password minimum 8 character long'
            : null;
  }

  String? validatePass2(value) {
    return value!.isEmpty
        ? 'Re-enter your Password'
        : passwordController1.text != passwordController2.text
            ? 'Password not match.'
            : null;
  }
}
