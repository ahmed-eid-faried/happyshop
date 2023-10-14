import 'package:get_storage/get_storage.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/items.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int index2, String categoriesId);
  getData(String categoryId, String? userid);
  goToItemsDetails(ItemsModel itemsModel, String herotag);
}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  List categories = [];
  late int index;
  List items = [];
  late String categoryId;
  late String? userid;
  late String? deliverytime;
  MyService myServices = Get.find();
  String totalrating = "";
  List<ItemsModel> itemsModelList = [];

  @override
  intialData() {
    index = Get.arguments['index'];
    categories = Get.arguments['categories'];
    categoryId = Get.arguments['categoryId'];
    userid = myServices.pref.getString("id");
    deliverytime = myServices.pref.getString("deliverytime");
    getData(categoryId, userid);
  }

  @override
  changeCat(int index2, String categoriesId) {
    index = index2;
    getData(categoriesId, userid);
    update();
  }

  final box = GetStorage();

  @override
  getData(categoryId, userid) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(categoryId, userid);
    statusRequest = handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          items.addAll(response['data']);
          box.write('ItemsControllerView$categoryId', response);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('ItemsControllerView$categoryId');
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

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
