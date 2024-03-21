import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Wakelock';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Screen Stays Awake?',
                style: TextStyle(fontSize: 42),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  textStyle: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  setState(() {
                    isEnabled = !isEnabled;
                    if (isEnabled) {
                      Wakelock.enable();
                    } else {
                      Wakelock.disable();
                    }
                  });
                },
                child: Text(isEnabled ? 'Active' : 'Not Active'),
              ),
            ],
          ),
        ),
      );
}
