// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';

// class CachedSvgController extends GetxController {
//   final box = GetStorage();
//   bool loading = true;
//   Future<String?>? cachedSvg(String url, String nameLocalFilePath) async {
//     loading = true;
//     String? svgContent = box.read('svg$nameLocalFilePath');
//     // ignore: unnecessary_null_comparison
//     if (svgContent != null && svgContent.isNotEmpty) {
//       loading = false;
//       update();
//       return svgContent;
//     } else {
//       final directory = await getApplicationDocumentsDirectory();
//       String svgPath = '${directory.path}/$nameLocalFilePath.svg';
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final file = File(svgPath);
//         await file.writeAsBytes(response.bodyBytes);
//         String? ksvgContent = await file.readAsString();
//         box.write('svg$nameLocalFilePath', ksvgContent);
//         loading = false;
//         update();
//         return ksvgContent;
//       } else {
//         loading = false;
//         update();
//         return svgContent;
//       }
//     }
//   }



// }

// class CachedSvgPicture extends StatelessWidget {
//   const CachedSvgPicture({
//     Key? key,
//     this.width,
//     this.height,
//     this.placeholderBuilder,
//     this.semanticsLabel,
//     this.colorFilter,
//     this.color,
//     this.colorBlendMode = BlendMode.clear,
//     this.matchTextDirection = false,
//     this.alignment = Alignment.center,
//     this.allowDrawingOutsideViewBox = false,
//     this.excludeFromSemantics = false,
//     this.clipBehavior = Clip.hardEdge,
//     this.theme = const SvgTheme(),
//     this.cacheColorFilter = false,
//     required this.svgUrlPath,
//     required this.nameLocalFilePath,
//     this.fit = BoxFit.contain,
//   }) : super(key: key);

//   final String svgUrlPath;
//   final String nameLocalFilePath;
//   final bool matchTextDirection;
//   final double? width;
//   final double? height;
//   final BoxFit fit;
//   final AlignmentGeometry alignment;
//   final bool allowDrawingOutsideViewBox;
//   final Widget Function(BuildContext)? placeholderBuilder;
//   final String? semanticsLabel;
//   final bool excludeFromSemantics;
//   final Clip clipBehavior;
//   final SvgTheme theme;
//   final ColorFilter? colorFilter;
//   final Color? color;
//   final BlendMode colorBlendMode;
//   final bool cacheColorFilter;

//   @override
//   Widget build(BuildContext context) {
//     Get.put(CachedSvgController());
//     return GetBuilder<CachedSvgController>(builder: (controller) {
//       return controller.loading == true
//           ? const CircularProgressIndicator()
//           : FutureBuilder<String?>(
//               future: controller.cachedSvg(svgUrlPath, nameLocalFilePath),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   print('Error: ${snapshot.error}');
//                   return SvgPicture.asset('assets/svg/offlinecat.svg');
//                 } else {
//                   final svgContent = snapshot.data;
//                   if (svgContent != null && svgContent.isNotEmpty) {
//                     return SvgPicture.string(
//                       svgContent,
//                       matchTextDirection: matchTextDirection,
//                       width: width,
//                       height: height,
//                       fit: fit,
//                       alignment: alignment,
//                       allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
//                       placeholderBuilder: placeholderBuilder,
//                       semanticsLabel: semanticsLabel,
//                       excludeFromSemantics: excludeFromSemantics,
//                       clipBehavior: clipBehavior,
//                       theme: theme,
//                       colorFilter: colorFilter,
//                       color: color,
//                       colorBlendMode: colorBlendMode,
//                       cacheColorFilter: cacheColorFilter,
//                     );
//                   } else {
//                     return SvgPicture.asset('assets/svg/offlinecat.svg');
//                   }
//                 }
//               },
//             );
//     });
//   }
// }
