import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double _left = -50;
  var _borderRadius = BorderRadius.circular(50);
  var _border = Border.all(width: 1);
  bool isSelected = false;

  animatedCrossfade() {
    setState(() {
      _left = _left == -50 ? 0 : -50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            animationTree(),
          ],
        ),
      ),
    );
  }

  //Custom Appbar
  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.grey[200],
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 5.0, top: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
          ),
          child: InkWell(
            onTap: () {
              animatedCrossfade();
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ),
      title: Text(
        'Side Menu',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  //Widget for the Animationblock
  Widget animationTree() {
    return Container(
      height: 300,
      width: 100,
      //color: Colors.redAccent,
      padding: EdgeInsets.only(top: 5, left: 5),
      child: Stack(
        children: [
          AnimatedPositioned(
            left: _left,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                border: _border,
              ),
              child: IconButton(
                  icon: Icon(Icons.person_outline), onPressed: () {}),
            ),
          ),
          AnimatedPositioned(
            top: 55,
            left: _left,
            duration: Duration(milliseconds: 600),
            curve: Curves.easeOut,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                border: _border,
              ),
              child: IconButton(icon: Icon(Icons.message), onPressed: () {}),
            ),
          ),
          AnimatedPositioned(
            top: 110,
            left: _left,
            duration: Duration(milliseconds: 700),
            curve: Curves.easeOut,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                border: _border,
              ),
              child: IconButton(
                  icon: Icon(Icons.card_membership), onPressed: () {}),
            ),
          ),
          AnimatedPositioned(
            top: 165,
            left: _left,
            duration: Duration(milliseconds: 900),
            curve: Curves.easeOut,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                border: _border,
              ),
              child: IconButton(icon: Icon(Icons.camera), onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
