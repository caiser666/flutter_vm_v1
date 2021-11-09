import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_vm_v1/app/widgets/cart_card_widget.dart';
import 'package:flutter_vm_v1/app/widgets/cart_floating_action_container_widget.dart';

import 'package:get/get.dart';

class CartView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {
        controller.calculateTotalPrice(controller.myCartList);
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Kerajang Kamu'),
            centerTitle: true,
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
                  () => ListView(
                    shrinkWrap: true,
                    reverse: true,
                    children: [
                      ...controller.myCartList.map((cart) {
                        return CartCardWidget(
                          cart: cart,
                          onClickDecrement: () => controller
                              .onClickIncremetDecrementQuantity(cart, 0),
                          onClickIncrement: () => controller
                              .onClickIncremetDecrementQuantity(cart, 1),
                          onClickRemove: () =>
                              controller.onClickRemoveProduct(cart),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Obx(
            () => CartFloatingActionContainerWidget(
              totalPrice: controller.totalPrice.value,
              onClick: () => controller.onClickToPayment(),
            ),
          ),
        );
      },
    );
  }
}

