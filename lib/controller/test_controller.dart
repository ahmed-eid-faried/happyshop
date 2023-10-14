import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/class/status_request.dart';
import 'package:happyshop/core/constant/applink.dart';
import 'package:happyshop/core/function/handling_data.dart';
import 'package:happyshop/data/datasource/remote/test.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  // Curd curd = Curd();
  // TestData testData = TestData(curd);
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        print(response['data']);
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Curd curd = Curd();
  check() async {
    // var x = await checkInternet();
    var y = curd.postData(AppLink.test, {});

    print(y);
  }

  @override
  void onInit() {
    check();
    getData();
    super.onInit();
  }
}
