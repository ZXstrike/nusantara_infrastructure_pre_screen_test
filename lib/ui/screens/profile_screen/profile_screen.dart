import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/controllers/profile_controller.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController pageController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();

    pageController.context = context;
    pageController.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GetBuilder<ProfileController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name : ${controller.user != null ? controller.user!.name : ''}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Email : ${controller.user != null ? controller.user!.email : ''}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Created At : ${controller.user != null ? '${controller.user!.createdAt.day}-${controller.user!.createdAt.month}-${controller.user!.createdAt.year}' : ''}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonSpace(
                boxColor: Colors.grey,
                onPressed: pageController.logOut,
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
