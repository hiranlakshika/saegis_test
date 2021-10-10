import 'package:flutter/cupertino.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({Key? key, required this.child}) : super(key: key);

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  int number = 0;

  setNumber(int newNumber) {
    setState(() {
      number = newNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Info(number: number, child: widget.child, stateWidgetState: this);
  }
}

class Info extends InheritedWidget {
  final int number;
  final _StateWidgetState stateWidgetState;

  const Info({Key? key, required this.number, required Widget child, required this.stateWidgetState})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant Info oldWidget) {
    return number != oldWidget.number;
  }

  static _StateWidgetState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Info>()?.stateWidgetState;
  }
}
