import 'package:happyshop/controller/address/add_address_details_controller.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/core/function/validinput.dart';
import 'package:happyshop/view/widget/auth/custom_text_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD YOUR ADDRESS"),
      ),
      body: GetBuilder<AddAddressDetailsController>(builder: (controller) {
        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: HandlingDataView(
              statusRequest: controller.statusRequest,
              child: ListView(
                children: [
                  CustomTextFieldAuth(
                      validator: (val) => validator(val, "text"),
                      controller: controller.city,
                      label: "City",
                      hintText: "City",
                      icon: Icons.location_city_outlined),
                  CustomTextFieldAuth(
                      validator: (val) => validator(val, "text"),
                      controller: controller.street,
                      label: "Street",
                      hintText: "Street",
                      icon: Icons.streetview_outlined),
                  CustomTextFieldAuth(
                      validator: (val) => validator(val, "text"),
                      controller: controller.name,
                      label: "Name",
                      hintText: "Name",
                      icon: Icons.location_searching),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.clearData();
                        },
                        child: const Text("Clear Data")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.addAdress();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Add Adress",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
