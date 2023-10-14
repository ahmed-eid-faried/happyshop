import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/favorite.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  addFavorite(String? itemsid);
  removeFavorite(String? itemsid);
  setFavorite(String? id, String? value);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};

  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  late String? itemsid;
  late String? userid;
  MyService myServices = Get.find();
  @override
  setFavorite(String? id, String? value) {
    isFavorite[id] = value;
    update();
  }

  @override
  addFavorite(itemsid) async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.addFavorite(userid, itemsid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFavorite(itemsid) async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeFavorite(userid, itemsid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
