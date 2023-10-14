import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/controller/contactus/custom_customers_service_controller.dart';
import 'package:happyshop/core/function/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCustomersService extends StatelessWidget {
  const CustomCustomersService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CustomCustomersServiceController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        title: const Text("Customers Service"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GetBuilder<CustomCustomersServiceController>(
        builder: (controller) {
          return Form(
            key: controller.formState,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                        validator: (value) => validator(value, "text"),
                        controller: controller.controllerMessage,
                        maxLines: 8,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Message"))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller.addMessage();
                        },
                        child: const Text("Send Message")),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
