import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/controllers/register_controller.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController pageController = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();

    pageController.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: pageController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.grey,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) => pageController.validateName(value),
                    keyboardType: TextInputType.name,
                    controller: pageController.nameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      icon: const Icon(
                        Icons.person_2_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                      label: const Text('Username'),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) => pageController.validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    controller: pageController.emailController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      icon: const Icon(
                        Icons.email_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                      label: const Text('Email'),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<RegisterController>(
                    builder: (controller) => TextFormField(
                      validator: (value) => pageController.validatePass1(value),
                      keyboardType: TextInputType.visiblePassword,
                      controller: pageController.passwordController1,
                      obscureText: controller.isVisible,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: const Icon(
                          Icons.lock_outline,
                          size: 40,
                          color: Colors.grey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: pageController.visibilityToggle,
                          child: Icon(
                            pageController.isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        label: const Text('Password'),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<RegisterController>(
                    builder: (controller) => TextFormField(
                      validator: (value) => pageController.validatePass2(value),
                      keyboardType: TextInputType.visiblePassword,
                      controller: pageController.passwordController2,
                      obscureText: controller.isVisible,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: const Icon(
                          Icons.lock_outline,
                          size: 40,
                          color: Colors.grey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: pageController.visibilityToggle,
                          child: Icon(
                            pageController.isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        label: const Text('Re-Enter your password'),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GetBuilder<RegisterController>(
                    builder: (controller) => ButtonSpace(
                      boxColor:
                          controller.isLoading ? Colors.white : Colors.grey,
                      onPressed: pageController.register,
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButtonSpace(
                    mainAlignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.center,
                    onPressed: pageController.goToLogin,
                    text: 'Already have an account? ',
                    textColor: Colors.grey,
                    textButton: 'Login',
                    fontSize: 16,
                    textButtonColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
