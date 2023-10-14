import 'package:happyshop/controller/items/items_details_controller.dart';
import 'package:happyshop/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:get/get.dart';

showRatingDialogItems(String itemid) {
  final dialog = RatingDialog(
    initialRating: 1.0,
    title: const Text(
      'E-commerce',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    message: const Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    image: Image.asset(AppImageAsset.logoImage, height: 100, width: 100),
    submitButtonText: 'Submit',
    submitButtonTextStyle: const TextStyle(fontWeight: FontWeight.bold),
    commentHint: 'Set your custom comment here',
    onSubmitted: (response) {
      ItemsDetailsControllerImp con = ItemsDetailsControllerImp();
      con.ratingItems(itemid, response.rating, response.comment);
      con.update();
    },
  );
  showDialog(context: Get.context!, builder: (context) => dialog);
}
