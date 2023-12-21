import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth/controller/payment_comtroller.dart';
import 'package:flutter_firebase/auth/widget/buttons.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final controller = Get.put(PaymentController());

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
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () async {
                  await controller.makePayment(context);
                },
                child: const Buttons(
                  title: 'Create Payment',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
