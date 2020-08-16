import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _images = [
    "https://picsum.photos/id/56/400/400",
    "https://picsum.photos/id/500/400/400",
    "https://picsum.photos/id/900/400/400",
    "https://picsum.photos/id/250/400/400",
    "https://picsum.photos/id/659/400/400",
    "https://picsum.photos/id/666/400/400"
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: new TinderSwapCard(
                swipeUp: true,
                swipeDown: true,
                orientation: AmassOrientation.TOP,
                totalNum: _images.length,
                stackNum: 4,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.width * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (context, index) => Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.network('${_images[index]}'),
                  ),
                ),
                cardController: controller = CardController(),
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  /// Get orientation & index of swiped card!
                      String sample  = "";
              if (orientation == CardSwipeOrientation.RIGHT) {
                sample = "Right";
              } else if (orientation == CardSwipeOrientation.LEFT) {
                sample = "Left";
              } else if (orientation == CardSwipeOrientation.UP) {
                sample = "Up";
              } else if (orientation == CardSwipeOrientation.DOWN) {
                sample = "down";
              }
                final snackBar = SnackBar(content: Text('You swiped $sample'));
                      Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ),
        ));
  }
}
