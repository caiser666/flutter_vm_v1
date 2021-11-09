import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/constants.dart';
import 'package:flutter_vm_v1/app/utils/my_helper.dart';
import 'package:flutter_vm_v1/app/widgets/text_button_widget.dart';
import 'package:get/get.dart';

class CartFloatingActionContainerWidget extends StatelessWidget {
  final double totalPrice;
  final Function onClick;

  const CartFloatingActionContainerWidget({
    Key? key,
    required this.totalPrice,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: Get.width,
      color: kAppColor_1.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Harga:",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    color: kAppColor_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    "Rp. ${MyHelper().currencyformat(totalPrice)}",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButtonWidget(
            onClick: () => onClick(),
            label: "LANJUT",
            isDisable: totalPrice == 0.0,
          )
        ],
      ),
    );
  }
}
