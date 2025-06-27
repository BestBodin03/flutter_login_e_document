import 'package:flutter/material.dart';
import 'package:newmaster/page/page32.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Page2Body();
  }
}

class Page2Body extends StatelessWidget {
  const Page2Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text("PAGE 2", style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Page32()),
              );
            },
            child: const Text("Go to Page 32"),
          ),
        ],
      ),
    );
  }
}
