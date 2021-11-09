import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_vm_v1/app/constants.dart';
import 'package:flutter_vm_v1/app/utils/my_custom_animation.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance.maskType = EasyLoadingMaskType.custom;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.light
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..indicatorSize = 48.0
    ..radius = 10.0
    ..progressColor = kAppColor_1
    ..backgroundColor = Colors.white
    ..indicatorColor = kAppColor_1
    ..textColor = Colors.black54
    ..maskColor = Colors.black12
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = MyCustomAnimation();
}
