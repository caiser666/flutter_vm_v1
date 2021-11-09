import 'package:flutter/material.dart';

class MyTextScaleFactor extends StatelessWidget {
  final Widget child;
  const MyTextScaleFactor({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _textScaleFactor = _mediaQuery.textScaleFactor.clamp(1.0, 1.1);
    
    return MediaQuery(
      data: _mediaQuery.copyWith(
        textScaleFactor: _textScaleFactor,
      ),
      child: child,
    );
  }
}
