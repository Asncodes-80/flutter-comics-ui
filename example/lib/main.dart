import 'package:example/config/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_comics_ui/flutter_comics_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Comics UI Kit",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: integralFontFace,
        textTheme: const TextTheme(
          headline2: TextStyle(fontStyle: FontStyle.italic),
          headline4: TextStyle(fontStyle: FontStyle.italic),
          headline5: TextStyle(fontStyle: FontStyle.italic),
          headline6: TextStyle(
            fontStyle: FontStyle.italic,
            wordSpacing: 1.9,
          ),
        ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ComicLabel(
          text: widget.title,
          strokeWidth: 4,
          textColors: [
            Colors.black,
            Colors.redAccent,
            Colors.purple.shade700,
          ],
          style: Theme.of(context).textTheme.headline6!,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ComicLabel(
              text: "Show count of appended number",
              strokeWidth: 4,
              textColors: const [
                Colors.black,
              ],
              style: Theme.of(context).textTheme.headline5!,
            ),
            ComicLabel(
              text: "Counter",
              strokeWidth: 8,
              textColors: const [
                Colors.redAccent,
                Colors.black,
                Colors.pink,
              ],
              style: Theme.of(context).textTheme.headline2!,
            ),
            ComicLabel(
              text: "$_counter",
              strokeWidth: 10,
              textColors: const [
                Colors.black,
                Colors.yellowAccent,
                Colors.green,
              ],
              style: Theme.of(context).textTheme.headline1!,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
