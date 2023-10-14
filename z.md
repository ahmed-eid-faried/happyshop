name: happyshop
description: Ecommerce App

publish_to: "none" # Remove this line if you wish to publish to pub.dev

version: 1.0.0+1

environment:
  sdk: ">=2.17.1 <3.0.0"

dependencies:
  # auto_animated: ^3.2.0
  # awesome_dialog: ^3.1.0
  # badges: ^3.1.1
  cached_network_image: ^3.2.3
  cached_network_svg_image: ^0.0.7
  # change_app_package_name: ^1.1.0
  cloud_firestore: ^4.9.0
  cupertino_icons: ^1.0.5
  dartz: ^0.10.1
  # device_preview: ^1.1.0
  dropdown_search: ^5.0.6
  firebase_auth: ^4.8.0
  firebase_core: ^2.15.0
  firebase_messaging: ^14.6.5
  flutter:
    sdk: flutter
  # flutter_appauth: ^6.0.2
  # flutter_facebook_auth: ^6.0.1
  flutter_local_notifications: ^15.1.0+1
  flutter_map: ^5.0.0
  flutter_native_splash: ^2.3.2
  # flutter_osm_plugin: ^0.55.3
  flutter_otp_text_field: ^1.1.1
  flutter_paypal_checkout: ^1.0.1
  flutter_ringtone_player: ^3.2.0
  flutter_screenutil: ^5.9.0
  # flutter_secure_storage: ^8.0.0
  flutter_stripe: ^9.3.0
  flutter_svg: ^2.0.7
  # flutter_svg_provider: ^1.0.6
  # fluttericon: ^2.0.0
  # font_awesome_flutter: ^10.5.0
  geocoding: ^2.1.0
  geolocator: ^9.0.2
  get: ^4.6.5
  get_storage: ^2.1.1
  # google_maps_flutter: ^2.3.1
  google_polyline_algorithm: ^3.1.0
  # google_sign_in: ^6.1.4
  # grouped_list: ^5.1.2
  icons_launcher: ^2.1.3
  # image_picker: ^1.0.0
  # image_pickers: ^2.0.4+1
  # intl: ^0.18.0
  jiffy: ^6.2.1
  latlong2: ^0.9.0
  # line_icons: ^2.0.3
  lottie: ^2.5.0
  otp_text_field: ^1.1.3
  path: ^1.8.3
  pay: ^1.1.2
  # qr_flutter: ^4.1.0
  rating_dialog: ^2.0.4
  responsive_builder: ^0.7.0
  shared_preferences: ^2.2.0
  # show_up_animation: ^2.0.0
  # sign_in_with_apple: ^5.0.0
  # sqflite: ^2.2.8+4
  url_launcher: ^6.1.12

dependency_overrides:
  http: ^1.0.0
  # flutter_map:
  #   git:
  #     url: https://github.com/fleaflet/flutter_map.git

dev_dependencies:
  flutter_lints: ^2.0.0
  flutter_test:
    sdk: flutter
# flutter pub run change_app_package_name:main com.amadytech.happyshop
# flutter pub get
# dart run icons_launcher:create
icons_launcher:
  image_path: "assets/images/logoapp.png"
  platforms:
    android:
      enable: true
    ios:
      enable: true
    web:
      enable: true
    macos:
      enable: false
    windows:
      enable: false
    linux:
      enable: false

# dart run flutter_native_splash:create
flutter_native_splash:
  color: "#ffffff"
  image: "assets/images/ic_launcher.png"
  background_image: "assets/images/background_ic_launcher.png"
  branding: "assets/images/background_ic_launcher.png"
  # color_dark: "#121212"
  color_dark: "#ffffff"
  image_dark: "assets/images/ic_launcher.png"
  branding_dark: "assets/images/background_ic_launcher.png"
  android_12:
    image: "assets/images/ic_launcher.png"
    icon_background_color: "#ffffff"
    image_dark: "assets/images/ic_launcher.png"
    icon_background_color_dark: "#ffffff"
  android_gravity: center
  web_image_mode: center
  ios_content_mode: center
  android: true
  ios: true
  web: true

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/
    - assets/lottie/
    - assets/svg/
    - assets/icons/

  fonts:
    - family: Cairo
      fonts:
        - asset: assets/fonts/Cairo/Cairo-Regular.ttf
        - asset: assets/fonts/Cairo/Cairo-Bold.ttf
          weight: 700

    - family: PlayfairDisplay
      fonts:
        - asset: assets/fonts/PlayfairDisplay/PlayfairDisplay-Regular.ttf
        - asset: assets/fonts/PlayfairDisplay/PlayfairDisplay-Bold.ttf
          weight: 700
