import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/controllers/login_controller.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController pageController = Get.put(LoginController());

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
                    'LOGIN',
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
                  GetBuilder<LoginController>(
                    builder: (controller) => TextFormField(
                      validator: (value) => pageController.validatePass(value),
                      keyboardType: TextInputType.visiblePassword,
                      controller: pageController.passwordController,
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
                    height: 25,
                  ),
                  GetBuilder<LoginController>(
                    builder: (controller) => ButtonSpace(
                      boxColor:
                          controller.isLoading ? Colors.white : Colors.grey,
                      onPressed: pageController.login,
                      child: const Text(
                        'Login',
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
                    onPressed: pageController.goToRegister,
                    text: 'Don\'t have an account? ',
                    textColor: Colors.grey,
                    textButton: 'Register',
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
