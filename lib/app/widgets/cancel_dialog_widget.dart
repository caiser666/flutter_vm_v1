import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/widgets/text_button_widget.dart';

class CancelDialogWidget extends StatelessWidget {
  final Function onClickCancel;

  const CancelDialogWidget({
    Key? key, required this.onClickCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Apakah anda, mau membatalkan pembelian?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonWidget(
                  onClick: () => onClickCancel(),
                  label: "IYA",
                  backgroundColor: Colors.red.shade900,
                  fontSize: 12.0,
                ),
                SizedBox(width: 16.0),
                TextButtonWidget(
                  onClick: () => {Navigator.pop(context)},
                  label: "TIDAK",
                  backgroundColor: Colors.green.shade900,
                  fontSize: 12.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
