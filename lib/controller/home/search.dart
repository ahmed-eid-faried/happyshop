import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/data/datasource/remote/search.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  getDataView(String search);
}

class SearchControllerImp extends SearchController {
  SearchData searchData = SearchData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  List searchitems = [];
  bool isSearch = false;
  TextEditingController? controllerSearch;
  checkSearch() {
    if (controllerSearch!.text == "") {
      isSearch = false;
      update();
    }
  }

  search() async {
    searchitems.clear();
    isSearch = false;
    if (controllerSearch!.text != "") {
      await getDataView(controllerSearch!.text);
      isSearch = true;
      update();
    }
  }

  @override
  getDataView(search) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchData.getData(search);
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      print(response['status']);
      if (response['status'] == "success") {
        List responseData = response['data'];
        searchitems = responseData.map((e) => ItemsModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    controllerSearch = TextEditingController();
    controllerSearch!.text = "";
    super.onInit();
  }
}
