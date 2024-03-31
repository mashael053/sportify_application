import 'package:flutter/material.dart';

import '../widget/player_widget.dart';
import '../widget/searchfield_widget.dart';

class players_screen extends StatelessWidget {
  const players_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var _screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 161, 195, 152)),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Center(child: searchfield()),
            for (int i = 0; i < 10; i++) players(_screen)
          ]),
        ));
  }
}
