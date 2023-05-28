import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const Color colorMain = Colors.black;
  static const Color colorNum = Colors.white10;
  static const Color colorFunc = Colors.white54;
  static const Color colorCalc = Colors.orange;
  static const Color colorText = Colors.white;

  String txtResult = "0";

  static const Map<String, IconData> _mapIcon = {
    "+/-": CupertinoIcons.plus_slash_minus,
    "%": CupertinoIcons.percent,
    "/": CupertinoIcons.divide,
    "x": CupertinoIcons.multiply,
    "-": CupertinoIcons.minus,
    "+": CupertinoIcons.plus,
    "=": CupertinoIcons.equal,
  };

  Widget button(String text, Color colorButton, Color colorText) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: colorText,
          backgroundColor: colorButton,
          shape: text == "0" ? const StadiumBorder() : const CircleBorder(),
        ),
        child: Padding(
          padding: text == "0"
              ? const EdgeInsets.only(left: 20, top: 20, right: 120, bottom: 20)
              : const EdgeInsets.all(16),
          child: _mapIcon.containsKey(text)
              ? Icon(
                  _mapIcon[text],
                  size: 40,
                )
              : Text(
                  text,
                  style: const TextStyle(fontSize: 30),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMain,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    txtResult,
                    style: const TextStyle(
                      color: colorText,
                      fontSize: 60,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                button("C", colorFunc, colorMain),
                button("+/-", colorFunc, colorMain),
                button("%", colorFunc, colorMain),
                button("/", colorCalc, colorText),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("7", colorNum, colorText),
                button("8", colorNum, colorText),
                button("9", colorNum, colorText),
                button("x", colorCalc, colorText),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("4", colorNum, colorText),
                button("5", colorNum, colorText),
                button("6", colorNum, colorText),
                button("-", colorCalc, colorText),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("1", colorNum, colorText),
                button("2", colorNum, colorText),
                button("3", colorNum, colorText),
                button("+", colorCalc, colorText),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("0", colorNum, colorText),
                button(".", colorNum, colorText),
                button("=", colorCalc, colorText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
