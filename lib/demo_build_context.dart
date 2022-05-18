import 'dart:math';

import 'package:flutter/material.dart';

class DemoBuildContext extends StatefulWidget {
  const DemoBuildContext({Key? key}) : super(key: key);

  @override
  State<DemoBuildContext> createState() => _DemoBuildContextState();
}

class _DemoBuildContextState extends State<DemoBuildContext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo inherited widget"),
        ),
        body: PositionedKey());
  }
}

class PositionedKey extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedKeyState();
}

class PositionedKeyState extends State<PositionedKey> {
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      StatelessColorful(
        key: UniqueKey(),
      ),
      StatelessColorful(key: UniqueKey()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: tiles))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles));
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorful extends StatefulWidget {
  StatelessColorful({Key? key}) : super(key: key);

  @override
  _StatelessColorfulState createState() => _StatelessColorfulState();
}

class _StatelessColorfulState extends State<StatelessColorful> {
  final Color color = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}

class UniqueColorGenerator {
  static Random random = new Random();

  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
