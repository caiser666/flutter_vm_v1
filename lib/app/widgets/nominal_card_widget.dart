import 'package:flutter/material.dart';
import 'package:flutter_vm_v1/app/constants.dart';

class NominalCardWidget extends StatelessWidget {
  final String label;
  final Function onClick;
  final bool isEnable;
  final double elevation;

  const NominalCardWidget({
    Key? key,
    required this.label,
    required this.onClick, 
    this.isEnable = true,
    this.elevation = 0.0, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
      elevation: isEnable ? elevation : 0.0,
      color: isEnable ? Colors.white : Colors.grey,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        side: BorderSide(
          color: isEnable ? kAppColor_1 : Colors.grey,
          width: 1.0,
        ),
      ),
      child: Container(
        child: Stack(
          children: [
            Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 18.0,
                  color: isEnable ? kAppColor_1 : Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                animationDuration: Duration(milliseconds: 500),
                color: Colors.transparent,
                child: InkWell(
                  splashColor: kAppColor_1.withOpacity(0.5),
                  onTap: isEnable ? () => onClick() : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
