import 'package:flutter/cupertino.dart';

class Info extends InheritedWidget {
  final int number;

  const Info({Key? key, required this.number, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Info oldWidget) {
    return number != oldWidget.number;
  }

  static Info? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Info>();
  }
}
