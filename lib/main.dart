import 'package:bellsreminder/auth/login.dart';
import 'package:bellsreminder/auth/signup.dart';
import 'package:bellsreminder/screen/dashboard/buttomdashboard.dart';
import 'package:bellsreminder/screen/dashboard/courselist.dart';
import 'package:bellsreminder/screen/dashboard/dashboard.dart';
import 'package:bellsreminder/screen/welcome/onboarding.dart';
import 'package:bellsreminder/screen/welcome/welcome.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/onboarding': (context) => Onboarding(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        //Profile Controller After Login
        '/buttomdashboard': (context) => const ButtomDashboard(),
        '/courselist': (context) => const CourseList(),
      },
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
