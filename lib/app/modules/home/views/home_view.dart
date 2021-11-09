import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/widgets/cart_floating_action_button_widget.dart';
import 'package:flutter_vm_v1/app/widgets/product_card_widget.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return WillPopScope(
          onWillPop: () => controller.onWillPopHome(context),
          child: Scaffold(
            appBar: AppBar(
              title: Text('Renyah-renyah'),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification? overscroll) {
                overscroll!.disallowGlow();
                return true;
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Center(
                  child: Obx(
                    () => Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: 12.0,
                      runSpacing: 12.0,
                      children: [
                        ...controller.productList.map((product) {
                          return ProductCardWidget(
                            product: product,
                            width: 172.0,
                            height: 196.0,
                            cartList: controller.myCartList,
                            onClick: () => controller.onClickAddProduct(product),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: CardFloatingActionButtonWidget(
              onClick: () => controller.onClickToCart(),
              list: controller.myCartList,
            ),
          ),
        );
      },
    );
  }
}

