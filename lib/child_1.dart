import 'package:flutter/material.dart';
import 'package:saegis_test/grand_child.dart';

import 'inherited_info.dart';

class ChildOne extends StatelessWidget {
  final int number;
  const ChildOne({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Info.of(context)!.number.toString()),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GrandChild(),
                    )),
                child: const Text('Click to navigate')),
          ],
        ),
      ),
    );
  }
}
