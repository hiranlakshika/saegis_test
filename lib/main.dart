import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:saegis_test/child_1.dart';
import 'package:saegis_test/inherited_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales:  const [Locale('en', 'US'), Locale('si', 'LK')],
      path: 'assets/translations', // <-- change the path of the translation files
      // fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  MyHomePage(title: 'title'.tr()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                key: const Key('name'),
                controller: name,
                decoration: const InputDecoration(labelText: 'User Name'),
              ),
              TextFormField(
                key: const Key('password'),
                obscureText: true,
                controller: pass,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              Text(message),
              ElevatedButton(
                  key: const Key('button'),
                  onPressed: () {
                    setState(() {
                      if (name.text.isNotEmpty && pass.text.isNotEmpty) {
                        message = 'Success';
                      } else {
                        message = 'Error';
                      }
                    });
                  },
                  child: const Text('Login')),
              OutlinedButton(
                onPressed: () {
                  Info.of(context)!.setNumber(Random().nextInt(100));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChildOne(
                          number: 10,
                        ),
                      ));
                },
                child: const Text('Navigate to Child'),
              ),
              OutlinedButton(onPressed: (){
                print(context.locale.toString());
              }, child: Text('Print Lang'))
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
