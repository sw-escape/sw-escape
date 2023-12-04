import 'package:flutter/material.dart';

import '../sideMenu.dart';

class CommonLiberalArts extends StatelessWidget {
  const CommonLiberalArts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SW ESCAPE',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Builder(
              builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: Icon(Icons.menu),
                  ))
        ],
      ),
      endDrawer: SideMenu(),
      body: Container(
        // color: Colors.blue,
        color: const Color(0xFF72BBFF),
        child: Column(
          children: [
            Container(
              height: 30,
              // color: Colors.indigo,
            ),
            //const ProgressBar(),
            Container(
              height: 60,
              // color: Colors.indigo,
            ),
            //const CommonMenu(),
          ],
        ),
      ),
    );
  }
}
