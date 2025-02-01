import 'package:flutter/material.dart';
import 'package:off_beat_restaurant/widgets/top_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    final mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          topWidget(mqh, mqw),
          Positioned(
              top: mqh * 0.26,
              child: Container(
                  height: mqh,
                  width: mqw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(children: [])))
        ],
      ),
    );
  }
}
