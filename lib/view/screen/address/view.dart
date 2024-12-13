import 'package:happyshop/controller/address/address_view_controller.dart';
import 'package:happyshop/core/class/handling_data_view.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/data/model/address_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addaddress);
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          title: const Text("View ADDRESS"),
          leading: IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.home);
              },
              icon: const Icon(Icons.arrow_back))),
      body: GetBuilder<AddressViewController>(
        builder: (controller) {
          return HandlingDataView(
              paddingOfflineViewDataWidget: false,
              view: true,
              statusRequest: controller.statusRequest,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    AddressDataModel addressDataModel = controller.data[index];
                    return Card(
                      child: ListTile(
                          onTap: () {
                            controller.edit(addressDataModel);
                          },
                          title: Text(addressDataModel.addressName!,
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 20),
                              maxLines: 1),
                          leading: const Icon(Icons.location_on, size: 30),
                          subtitle: Text(
                              "${addressDataModel.addressCity!} ${addressDataModel.addressStreet!}",
                              textAlign: TextAlign.start,
                              maxLines: 3),
                          trailing: IconButton(
                              onPressed: () {
                                controller.delete(addressDataModel.addressId);
                              },
                              icon: const Icon(Icons.delete_outline_rounded,
                                  size: 30))),
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
