// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class ForgetPasswordData {
  Curd curd;
  ForgetPasswordData(this.curd);
  postData(String email) async {
    var response = await curd.postData(AppLink.chechemailforgetpassword, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
