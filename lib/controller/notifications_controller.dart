import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/core/services/services.dart';
import 'package:happyshop/data/datasource/remote/notifications_data.dart';
import 'package:happyshop/data/model/notifications_data_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationsController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  List<NotificationsDataModel> data = [];
  final box = GetStorage();

  getData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData.getData(userid!);
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          List responseData = response['data'];
          data = responseData
              .map((e) => NotificationsDataModel.fromJson(e))
              .toList();
          box.write('NotificationsController', response);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('NotificationsController');
      if (response != null) {
        List responseData = response['data'];
        data = responseData
            .map((e) => NotificationsDataModel.fromJson(e))
            .toList();
        statusRequest = StatusRequest.offlineViewData;
      }
    }
    update();
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
