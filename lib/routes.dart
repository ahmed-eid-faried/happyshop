import 'package:happyshop/core/constant/routes.dart';
import 'package:happyshop/core/middleware/middlewares.dart';
 import 'package:happyshop/view/screen/about.dart';
import 'package:happyshop/view/screen/cart/payment_page.dart';
import 'package:happyshop/view/screen/address/add.dart';
import 'package:happyshop/view/screen/address/add_address_details.dart';
import 'package:happyshop/view/screen/address/edit.dart';
import 'package:happyshop/view/screen/address/view.dart';
import 'package:happyshop/view/screen/auth/Verfiy_code_signup.dart';
import 'package:happyshop/view/screen/cart/cart.dart';
import 'package:happyshop/view/screen/cart/checkout.dart';
import 'package:happyshop/view/screen/contactus/contactus.dart';
import 'package:happyshop/view/screen/contactus/customcustomersservice.dart';
import 'package:happyshop/view/screen/favorite.dart';
import 'package:happyshop/view/screen/forgetpassword/forget_password.dart';
import 'package:happyshop/view/screen/forgetpassword/reset_password.dart';
import 'package:happyshop/view/screen/forgetpassword/success_resetpassword.dart';
import 'package:happyshop/view/screen/forgetpassword/verfiy_code.dart';
import 'package:happyshop/view/screen/auth/login.dart';
import 'package:happyshop/view/screen/auth/signup.dart';
import 'package:happyshop/view/screen/auth/success_sign_up.dart';
import 'package:happyshop/view/screen/home_screen/homeapp.dart';
import 'package:happyshop/view/screen/items/items.dart';
import 'package:happyshop/view/screen/items/items_details.dart';
import 'package:happyshop/view/screen/items/offers.dart';
import 'package:happyshop/view/screen/lang.dart';
import 'package:happyshop/view/screen/notifications.dart';
import 'package:happyshop/view/screen/onboarding.dart';
import 'package:happyshop/view/screen/orders/order_archive.dart';
import 'package:happyshop/view/screen/orders/orderdetails.dart';
import 'package:happyshop/view/screen/orders/orders.dart';
import 'package:happyshop/view/screen/orders/tracking_orders_details.dart';
import 'package:happyshop/view/screen/settings.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/test", page: () => const MySignIn()),

  //lang
  GetPage(
      name: AppRoute.lang,
      page: () => const Lang(),
      middlewares: [MiddlewaresLogin()]),

  //Auth
  GetPage(name: AppRoute.singup, page: () => const SignUp()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.login, page: () => const Login()),

  //forgetpassword
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.verfiyCodeForgetPassword,
      page: () => const VerfiyCodeForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetpassword()),

  //onboarding
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  //home

  GetPage(name: AppRoute.home, page: () => const Home()),
  //items
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.itemsdetails, page: () => const ItemsDetails()),
  // favorite
  GetPage(name: AppRoute.favorite, page: () => const Favorite()),
  // Settings
  GetPage(name: AppRoute.settings, page: () => const Settings()),
  // Cart
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  // Checkout
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  // PaymentPage
  GetPage(name: AppRoute.paymentpage, page: () => const PaymentPage()),
  // OrdersView
  GetPage(name: AppRoute.ordersView, page: () => const OrdersView()),
  // OrderArchive
  GetPage(name: AppRoute.orderarchive, page: () => const OrderArchive()),
  // OrderDetails
  GetPage(name: AppRoute.orderdetails, page: () => const OrderDetails()),
  // trackingorderdetails
  GetPage(
      name: AppRoute.trackingorderdetails,
      page: () => const TrackingOrderDetails()),

  // address
  GetPage(name: AppRoute.addaddress, page: () => const AddAddress()),
  GetPage(name: AppRoute.addressparttwo, page: () => const AddAddressDetails()),
  GetPage(name: AppRoute.addressedit, page: () => const AddAddressEdit()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  // AboutUs
  GetPage(name: AppRoute.aboutus, page: () => const AboutUs()),
  // ContactUs
  GetPage(name: AppRoute.contactus, page: () => const ContactUs()),
  GetPage(
      name: AppRoute.customcustomersservice,
      page: () => const CustomCustomersService()),
  // Notifications
  GetPage(
      name: AppRoute.notifications,
      page: () => const Notifications(),
      bindings: const []),
  // Offers
  GetPage(name: AppRoute.offers, page: () => const Offers()),
];
