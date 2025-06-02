import 'dart:ui';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Page1Body(),
    );
  }
}

class Page1Body extends StatefulWidget {
  const Page1Body({Key? key}) : super(key: key);

  @override
  State<Page1Body> createState() => _Page1BodyState();
}

class _Page1BodyState extends State<Page1Body> {
  double _left = 0.0;
  final double boxSize = 25.0;
  final double maxWidth = 300.0; // ความกว้างสูงสุดที่เลื่อนได้

  void _moveBox() {
    setState(() {
      // if (_left + boxSize > maxWidth - boxSize) {
      //   _left = 0.0;
      // } else {
        _left += boxSize;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // กล่องเลื่อน
            Container(
              width: maxWidth,
              height: boxSize,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: _left,
                    top: 0,
                    child: GestureDetector(
                      onTap: _moveBox,
                      child: Container(
                        width: boxSize,
                        height: boxSize,
                        color: Colors.pink,
                        alignment: Alignment.center,
                        child: const Text(
                          "PAGE 1",
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // กล่องธรรมดา
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                colorBox(Colors.black38),
                imageBox(),
                colorBox(Colors.purple),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                blankBox(),
                colorBox(Colors.amber),
                blankBox(),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("My21st Century Symphony."),
                ],
              ),
            ),

            Container(
              width: 200,
              height: 1000,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logoonly_tpkpng.png'),
                      fit: BoxFit.contain,
                    ),
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Oscar Winning Tears.",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("RAYE, The Heritage Orchestra, Flame Collective",
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 12)),
                ],
              ),
            ),

            Container(
                padding: const EdgeInsets.all(16.0),
                width: 300,
                color: Colors.green,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.shuffle,
                      color: Colors.lightGreenAccent,
                      size: 24,
                    ),
                    Icon(
                      Icons.play_circle_fill,
                      color: Colors.lightGreenAccent,
                      size: 48,
                    ),
                    Icon(
                      Icons.queue_music,
                      color: Colors.lightGreenAccent,
                      size: 24,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget blankBox() => const SizedBox(width: 25, height: 25);

  Widget colorBox(Color color) => Container(
        width: 25,
        height: 25,
        color: color,
        alignment: Alignment.center,
        child: const Text(
          "PAGE 1",
          style: TextStyle(color: Colors.white, fontSize: 8),
        ),
      );

  Widget imageBox() => Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/logoonly_tpkpng.png'),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.grey),
        ),
      );
}
