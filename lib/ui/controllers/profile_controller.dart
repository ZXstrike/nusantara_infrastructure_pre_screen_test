import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/services/profile_services.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/profile_models/profiles_models.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/widgets/confirmation_card.dart';
import 'package:nusantara_infrastructure_pre_screen_test/utils/constant/sp_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  late BuildContext context;

  Profile? user;

  void getUserData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.token);
    if (token != null) {
      Profile? data = await ProfileServices.getProfile(token: token);
      user = data;
    } else {
      goToLogin();
    }
    update();
  }

  void logOut() {
    showDialog(
      context: context,
      builder: (context) => Confirmation(
        message: 'Are you Sure?',
        tittle: 'Logout',
        confirmAction: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.clear();
          user = null;

          goToLogin();
        },
      ),
    );
  }

  void goToLogin() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
