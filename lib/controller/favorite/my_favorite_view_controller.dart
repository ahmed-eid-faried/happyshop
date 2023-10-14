import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/myfavoriteviewdata.dart';
import 'package:happyshop/data/model/items_model.dart';
import 'package:happyshop/data/model/my_favorite_view_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class MyFavoriteViewController extends GetxController {
  getdata();
  deletedata(String? favoriteId);
  goToItemsDetails(itemsModel, String herotag);
}

class MyFavoriteViewControllerImp extends MyFavoriteViewController {
  MyFavoriteViewData myFavoriteViewData = MyFavoriteViewData(Get.find());
  List myFavoriteViewList = [];
  List itemsViewList = [];

  StatusRequest statusRequest = StatusRequest.noAction;
  late String? userid;
  MyService myServices = Get.find();
  final box = GetStorage();

  @override
  getdata() async {
    myFavoriteViewList.clear();
    itemsViewList.clear();
    statusRequest = StatusRequest.loading;
    userid = myServices.pref.getString("id");
    update();
    var response = await myFavoriteViewData.getdata(userid);
    statusRequest = handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        box.write('MyFavoriteViewController', response);
        print(response['status']);
        if (response['status'] == "success") {
          List responseData = response['data'];
          myFavoriteViewList =
              responseData.map((e) => MyFavoriteViewModel.fromJson(e)).toList();
          itemsViewList =
              responseData.map((e) => ItemsModel.fromJson(e)).toList();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('MyFavoriteViewController');
      if (response != null) {
        List responseData = response['data'];
        myFavoriteViewList =
            responseData.map((e) => MyFavoriteViewModel.fromJson(e)).toList();
        itemsViewList =
            responseData.map((e) => ItemsModel.fromJson(e)).toList();
        statusRequest = StatusRequest.offlineViewData;
      }
    }
    update();
  }

  @override
  deletedata(favoriteId) {
    myFavoriteViewData.deletedata(favoriteId);
    myFavoriteViewList
        .removeWhere((element) => element.favoriteId == favoriteId);
    if (myFavoriteViewList.isEmpty) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  @override
  goToItemsDetails(itemsModel, String herotag) {
    Get.toNamed(AppRoute.itemsdetails,
        arguments: {"itemsModel": itemsModel, "herotag": herotag});
  }
}
