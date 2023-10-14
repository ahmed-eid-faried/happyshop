import 'package:get_storage/get_storage.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/offers.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class OffersController extends GetxController {
  getData();
  goToItemsDetails(ItemsModel itemsModel, String herotag);
}

class OffersControllerImp extends OffersController {
  final box = GetStorage();
  OffersData offersData = OffersData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  List categories = [];
  List items = [];
  String averageTime = '';
  MyService myService = Get.find();

  @override
  void onInit() {
    averageTime = myService.pref.getString('deliverytime') ?? "30 MIN";
    getData();

    super.onInit();
  }

  @override
  getData() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getData();
    statusRequest = handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          items.addAll(response['data']);
          box.write('OffersController', response);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('OffersController');
      if (response != null) {
        items.addAll(response['data']);
        statusRequest = StatusRequest.offlineViewData;
      }
    }
    update();
  }

  @override
  goToItemsDetails(itemsModel, String herotag) {
    Get.toNamed(AppRoute.itemsdetails,
        arguments: {"itemsModel": itemsModel, "herotag": herotag});
  }
}
