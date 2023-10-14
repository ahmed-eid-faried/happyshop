// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:happyshop/core/class/curd.dart';
import 'package:happyshop/core/constant/applink.dart';

class VerfiyCodeSignUpData {
  Curd curd;
  VerfiyCodeSignUpData(this.curd);
  postData(String email, String verifycode) async {
    var response = await curd.postData(AppLink.verifycodesignup, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resend(String email) async {
    var response = await curd.postData(AppLink.resend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
