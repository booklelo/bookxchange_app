import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookLelo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'BookLelo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  String _title = "PLACEHOLDER";

  _MyHomePageState(String title) : _title = title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blue[800]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to BookLelo!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Your one-stop solution for book lovers.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
