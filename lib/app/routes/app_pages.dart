import 'package:flutter_vm_v1/app/modules/home/views/cart_view.dart';
import 'package:flutter_vm_v1/app/modules/home/views/payment_view.dart';
import 'package:flutter_vm_v1/app/utils/my_text_scale_factor.dart';
import 'package:get/get.dart';

import 'package:flutter_vm_v1/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_vm_v1/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MyTextScaleFactor(child:HomeView()),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => MyTextScaleFactor(child: CartView()),
      binding: HomeBinding(),
    ),
     GetPage(
      name: _Paths.PAYMENT,
      page: () => MyTextScaleFactor(child: PaymentView()),
      binding: HomeBinding(),
    ),
  ];
}
