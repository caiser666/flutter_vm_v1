import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/constants.dart';
import 'package:flutter_vm_v1/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_vm_v1/app/utils/my_helper.dart';
import 'package:flutter_vm_v1/app/widgets/nominal_card_widget.dart';
import 'package:flutter_vm_v1/app/widgets/text_button_widget.dart';

import 'package:get/get.dart';

class PaymentView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return WillPopScope(
          onWillPop: () => controller.onWillPopPayment(context),
          child: Scaffold(
            appBar: AppBar(
              title: Text('Pembayaran'),
              centerTitle: true,
            ),
            body: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: kAppColor_1,
                              width: 1.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 4.0,
                                spreadRadius: 0.5,
                                color: kAppColor_1,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                "Total Harga yang harus dibayar:",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                "Rp. ${MyHelper().currencyformat(controller.totalPrice.value)}",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "**Masukkan uang sesuai total harga",
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.red,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: Get.width,
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 24.0),
                    color: Colors.black12,
                    child: Column(
                      children: [
                        AdmissionFeeContainerWidget(
                          admissionFee: controller.admissionFee.value,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NominalContainerWidget(
                              nominalList: controller.myNominalList,
                              onClick: (nominal) =>
                                  controller.onClickNominal(nominal),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButtonWidget(
                                    onClick: () =>
                                        controller.onClickCancel(context),
                                    label: "BATAL",
                                    width: 144.0,
                                    height: 36.0,
                                    backgroundColor: Colors.red.shade900,
                                    fontSize: 16.0,
                                  ),
                                  SizedBox(height: 16.0),
                                  TextButtonWidget(
                                    onClick: () => controller.onClickPay(context),
                                    label: "BAYAR",
                                    isDisable: controller.admissionFee.value <
                                        controller.totalPrice.value,
                                    width: 144.0,
                                    height: 64.0,
                                    backgroundColor: Colors.blue.shade900,
                                    fontSize: 20.0,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdmissionFeeContainerWidget extends StatelessWidget {
  final double admissionFee;

  const AdmissionFeeContainerWidget({
    Key? key,
    this.admissionFee = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 4.0,
            spreadRadius: 0.5,
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Jumlah Uang Masuk:",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black38,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            "Rp. ${MyHelper().currencyformat(admissionFee)}",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class NominalContainerWidget extends StatelessWidget {
  final List<dynamic> nominalList;
  final Function(dynamic nominal)? onClick;

  const NominalContainerWidget({
    Key? key,
    required this.nominalList,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.black12,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 4.0,
              spreadRadius: 0.5,
              color: Colors.black26,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nominal Pecahan (Rp) :",
              style: TextStyle(
                fontSize: 12.0,
                color: kAppColor_1,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.0),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 2.0,
              padding: EdgeInsets.only(bottom: 4.0),
              children: [
                ...nominalList.map((nominal) {
                  return NominalCardWidget(
                    label: MyHelper().currencyformat(nominal.value),
                    isEnable: nominal.isActive,
                    elevation: 2.0,
                    onClick: () => onClick!(nominal),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
