import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/utils/my_helper.dart';

class SuccessDialogWidget extends StatelessWidget {
  final double changeMoney;

  const SuccessDialogWidget({
    Key? key,
    this.changeMoney = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Terima Kasih & \n Selamat Menikmati",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          changeMoney != 0.0 ?  Container(
            margin: EdgeInsets.only(top: 12.0),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ohh, iya. Ada sisa kembalian nih!!",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sisa kembalian:",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      "Rp. ${MyHelper().currencyformat(changeMoney)}",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
