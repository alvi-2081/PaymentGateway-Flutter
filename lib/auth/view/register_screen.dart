import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/controller/user_controller.dart';
import 'package:flutter_firebase/auth/model/user_model.dart';
import 'package:get/get.dart';

import '../widget/buttons.dart';
import '../widget/input_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 233, 240),
              Color.fromARGB(255, 206, 232, 255),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.9, 0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  const Text(
                    'Register Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              InputField(
                controller: email,
                hintText: 'Enter email address',
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                controller: password,
                hintText: 'Enter password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                controller: confirmPassword,
                hintText: 'Enter confirm password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  if (password.text.trim() == confirmPassword.text.trim()) {
                    await controller.createUser(
                      UserModel(
                        email: email.text,
                        password: password.text.trim(),
                      ),
                    );
                  } else {
                    print('error');
                  }
                },
                child: const Buttons(
                  title: 'Create Account',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
