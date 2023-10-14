import 'package:happyshop/controller/home/search.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/home.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class HomeScreenController extends GetxController {
  getDataView();
  goToItems(List categories, int index, String categoryId);
  goToItemsDetails(itemsModel, String herotag);
}

class HomeScreenControllerImp extends HomeScreenController {
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  List categories = [];
  List items = [];
  List itemsdiscount = [];
  List topSelling = [];
  List topRating = [];
  List settings = [];
  String title = "";
  String body = "";
  String deliverytime = "";
  String settingstel = '';
  String settingssms = '';
  String settingsemail = '';
  SearchControllerImp searchControllerImp = SearchControllerImp();
  final box = GetStorage();

  @override
  getDataView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = await handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          box.write('HomeScreenControllerImp', response);
          await updateData(response);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('HomeScreenControllerImp');
      if (response != null) {
        updateData(response);
        statusRequest = StatusRequest.offlineViewData;
      }
    }
    update();
  }

  updateData(response) {
    MyService myService = Get.find();
    categories.addAll(response['categories']);
    items = response['items'].map((e) => ItemsModel.fromJson(e)).toList();
    itemsdiscount =
        response['items_discount'].map((e) => ItemsModel.fromJson(e)).toList();
    topSelling =
        response['itemstopselling'].map((e) => ItemsModel.fromJson(e)).toList();
    topRating =
        response['itemstoprating'].map((e) => ItemsModel.fromJson(e)).toList();
    settings.addAll(response['settings']);
    title = settings[0]['settings_titlehome'];
    body = settings[0]['settings_bodyhome'];
    deliverytime = settings[0]['settings_deliverytime'];
    settingstel = settings[0]['settings_tel'];
    settingssms = settings[0]['settings_sms'];
    settingsemail = settings[0]['settings_email'];
    myService.pref.setString('deliverytime', deliverytime);
    myService.pref.setString('settingstel', settingstel);
    myService.pref.setString('settingssms', settingssms);
    myService.pref.setString('settingsemail', settingsemail);
  }

  @override
  void onInit() {
    getDataView();
    super.onInit();
  }

  @override
  goToItems(List categories, int index, String categoryId) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "index": index,
      "categoryId": categoryId
    });
  }

  @override
  goToItemsDetails(itemsModel, String herotag) {
    Get.toNamed(AppRoute.itemsdetails,
        arguments: {"itemsModel": itemsModel, "herotag": herotag});
  }
}
