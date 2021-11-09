import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String label;
  final bool isDisable, isFull;
  final Alignment alignment;
  final Function onClick;
  final double width, height, fontSize;
  final Color backgroundColor, fontColor;

  const TextButtonWidget({
    Key? key,
    required this.onClick,
    this.label = "SUBMIT",
    this.isDisable = false,
    this.isFull = false,
    this.alignment = Alignment.centerRight,
    this.width = 0,
    this.backgroundColor = const Color(0xFF2196F3),
    this.fontSize = 14.0,
    this.fontColor = const Color(0xFFFFFFFF),
    this.height = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFull
          ? MediaQuery.of(context).size.width
          : width != 0
              ? width
              : null,
      alignment: width == 0 && !isFull ? alignment : null,
      height: height != 0 ? height : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: backgroundColor.withOpacity(0.5),
          elevation: 4.0,
          side: BorderSide(
            width: 1.0,
            color: backgroundColor,
          ),
        ),
        onPressed: !isDisable ? () => onClick() : null,
        child: Text(
          label,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
