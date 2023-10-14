import 'package:happyshop/controller/orders/tracking_controller.dart';
import 'package:happyshop/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCallAndDoneWidet extends StatelessWidget {
  const CustomCallAndDoneWidet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TrackingControllerImp controller = Get.put(TrackingControllerImp());
    return Positioned(
      bottom: 20,
      child: SizedBox(
        // height: 50,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                controller.callPhone();
              },
              color: AppColor.fifthColor,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.call,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      'Delivery-man',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
