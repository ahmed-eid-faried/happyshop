import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/address.dart';
import 'package:happyshop/data/model/address_data_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  List<AddressDataModel> data = [];
  final box = GetStorage();

  getData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewAddress(userid!);
    statusRequest = handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          List responseData = response['data'];
          data = responseData.map((e) => AddressDataModel.fromJson(e)).toList();
          box.write('AddressViewController', response);
        } else {
          Get.defaultDialog(middleText: "Please Try Add Address");
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('AddressViewController');
      if (response != null) {
        List responseData = response['data'];
        data = responseData.map((e) => AddressDataModel.fromJson(e)).toList();
        statusRequest = StatusRequest.offlineViewData;
      }
    }
    update();
  }

  delete(addressId) async {
    await addressData.deleteAddress(addressId!);
    data.removeWhere((element) => element.addressId == addressId);
    update();
  }

  edit(addressDataModel) {
    Get.toNamed(AppRoute.addressedit,
        arguments: {"addressDataModel": addressDataModel});
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
