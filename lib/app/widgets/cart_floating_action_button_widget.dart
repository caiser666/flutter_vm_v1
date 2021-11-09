import 'package:flutter/material.dart';

class CardFloatingActionButtonWidget extends StatelessWidget {
  final Function onClick;
  final List<dynamic> list;

  const CardFloatingActionButtonWidget({
    Key? key,
    required this.onClick,
    this.list = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Stack(
          alignment: Alignment(1.0, -1.0),
          children: [
            FloatingActionButton(
              onPressed: () => onClick(),
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 500),
                alignment: Alignment.center,
                reverseDuration: Duration(milliseconds: 500),
                firstChild: Icon(
                  Icons.shopping_cart_outlined,
                  size: 32.0,
                ),
                firstCurve: Curves.easeInOut,
                secondChild: Icon(
                  Icons.shopping_cart_rounded,
                  size: 32.0,
                ),
                secondCurve: Curves.easeInOut,
                crossFadeState: list.length != 0
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
              ),
              backgroundColor: Colors.lightBlue,
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              opacity: list.length != 0 ? 1 : 0,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 24,
                  minWidth: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.black38,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    '${list.length}',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
