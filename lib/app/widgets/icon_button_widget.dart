import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function onClick;
  final Color iconColor, splashColor, backgroundColor;
  final double iconSize, splashRadius, padding;
  final double? borderRadius;
  final bool isShadow, isEnable;

  const IconButtonWidget({
    Key? key,
    required this.icon,
    required this.onClick,
    this.iconColor = const Color(0xff06afc5),
    this.splashColor = const Color(0xff06afc5),
    this.backgroundColor = const Color(0x00000000),
    this.iconSize = 24,
    this.splashRadius = 16,
    this.padding = 4.0,
    this.borderRadius,
    this.isShadow = false, this.isEnable = true,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _borderRadius = borderRadius == null ? iconSize * 2 : borderRadius!;

    return Container(
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: !isShadow ? Colors.transparent : Colors.grey.withOpacity(0.2),
          width: 1.0,
        ),
        boxShadow: isShadow
            ? [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4,
                  color: Colors.grey,
                ),
              ]
            : [],
      ),
      child: Material(
        animationDuration: Duration(milliseconds: 500),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Container(
          child: IconButton(
            onPressed: isEnable ? () => onClick() : null,
            padding: EdgeInsets.all(padding),
            constraints: BoxConstraints(),
            splashRadius: splashRadius,
            splashColor: isEnable ? splashColor : Colors.transparent,
            color: isEnable ? iconColor : Colors.grey,
            iconSize: iconSize,
            icon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
