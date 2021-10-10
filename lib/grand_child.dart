import 'dart:math';

import 'package:flutter/material.dart';

import 'inherited_info.dart';

class GrandChild extends StatelessWidget {
  const GrandChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grand Child'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Info.of(context)!.number.toString()),
            TextButton(onPressed: (){
              Info.of(context)!.setNumber(Random().nextInt(100));
            }, child: const Text('Click to change')),
          ],
        ),
      ),
    );
  }
}
