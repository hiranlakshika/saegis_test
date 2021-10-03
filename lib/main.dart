import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
                  child: const Text('Login'))
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
