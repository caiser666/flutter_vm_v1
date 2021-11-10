import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_vm_v1/app/models/my_cart_model.dart';
import 'package:flutter_vm_v1/app/models/nominal_model.dart';
import 'package:flutter_vm_v1/app/models/product_model.dart';
import 'package:flutter_vm_v1/app/routes/app_pages.dart';
import 'package:flutter_vm_v1/app/utils/my_helper.dart';
import 'package:flutter_vm_v1/app/widgets/cancel_dialog_widget.dart';
import 'package:flutter_vm_v1/app/widgets/success_dialog_widget.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    productList.value = products;
    myNominalList.value = nominals;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<MyCartModel> myCartList = <MyCartModel>[].obs;

  void onClickAddProduct(ProductModel product) {
    if (!myCartList.any((cart) => cart.product == product)) {
      MyCartModel cart = new MyCartModel(product: product);
      myCartList.add(cart);
    }

    update();
  }

  Future<void> onClickToCart() async {
    EasyLoading.show();
    await new Future.delayed(Duration(milliseconds: 1000), () async {
      Get.toNamed(Routes.CART);
      await new Future.delayed(Duration(milliseconds: 500), () {
        EasyLoading.dismiss();
      });
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPopHome(BuildContext context) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      MyHelper().snackBarShow(context, "Tap back again to leave", 0);
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(false);
  }

  void onClickIncremetDecrementQuantity(MyCartModel myCart, int type) {
    int _index = myCartList.indexWhere((cart) => cart == myCart);

    if (type == 1) {
      myCartList[_index].quantity += 1;
    } else {
      myCartList[_index].quantity -= 1;
    }

    calculateTotalPrice(myCartList);

    update();
  }

  RxDouble totalPrice = 0.0.obs;

  void calculateTotalPrice(List<MyCartModel> cartList) {
    totalPrice.value = 0.0;

    if (cartList.length != 0) {
      for (var cart in cartList) {
        double _totalPrice = cart.quantity * cart.product.price;

        totalPrice.value += _totalPrice;
      }
    }
  }

  void onClickRemoveProduct(MyCartModel cart) {
    myCartList.remove(cart);

    calculateTotalPrice(myCartList);

    update();
  }

  Future<void> onClickToPayment() async {
    EasyLoading.show();
    await new Future.delayed(Duration(milliseconds: 1000), () async {
      Get.toNamed(Routes.PAYMENT);
      // Get.offNamed(Routes.PAYMENT);
      await new Future.delayed(Duration(milliseconds: 500), () {
        EasyLoading.dismiss();
      });
    });
  }

  RxList<NominalModel> myNominalList = <NominalModel>[].obs;
  RxDouble admissionFee = 0.0.obs;

  void onClickNominal(NominalModel nominal) {
    admissionFee.value += nominal.value;
  }

  RxBool isPay = false.obs;
  RxBool isPaymentSuccess = false.obs;

  Future<void> onClickPay(BuildContext context) async {
    isPay.value = true;
    EasyLoading.show();

    double _changeMoney = admissionFee.value - totalPrice.value;

    for (var cart in myCartList) {
      int _productIndex =
          products.indexWhere((product) => product.id == cart.product.id);

      products[_productIndex].stock -= cart.quantity;
    }

    update();

    await new Future.delayed(Duration(milliseconds: 3000), () async {
      isPaymentSuccess.value = true;
      EasyLoading.dismiss();
      MyHelper().dialogShow(context,
          title: "",
          content: SuccessDialogWidget(
            changeMoney: _changeMoney,
          ),
          isDismissible: false,
          onWillPop: () => onClickTransactionCancellation(context));

      await new Future.delayed(Duration(milliseconds: 5000), () async {
        try {
          onClickTransactionCancellation(context);
        } catch (e) {
          print(e.toString());
        }
      });
    });
  }

  RxBool isClickCancel = false.obs;
  Future<void> onClickCancel(BuildContext context) async {
    if (!isClickCancel.value) {
      isClickCancel.value = true;
      await new Future.delayed(Duration(milliseconds: 250), () async {
        isClickCancel.value = false;
        MyHelper().dialogShow(
          context,
          title: "",
          content: CancelDialogWidget(
            onClickCancel: () => onClickTransactionCancellation(context),
          ),
          isDismissible: true,
        );
      });
    }
  }

  void onClickTransactionCancellation(BuildContext context) {
    myCartList.clear();
    totalPrice.value = 0.0;
    admissionFee.value = 0.0;
    isPay.value = false;
    isPaymentSuccess.value = false;

    Navigator.of(context).popUntil((route) => route.isFirst);

    update();
  }

  Future<bool> onWillPopPayment(BuildContext context) async {
    if (isPay.value) {
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
