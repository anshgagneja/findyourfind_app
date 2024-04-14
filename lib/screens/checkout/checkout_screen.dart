import 'package:flutter/material.dart';

import '../../components/socal_card.dart';
import '../../constants.dart';
import 'components/address_form.dart';

class CheckOutScreen extends StatelessWidget {
  static String routeName = "/check_out";

  const CheckOutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const AddressForm(),
                  const SizedBox(height: 16),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
