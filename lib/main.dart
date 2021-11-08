import 'package:demo_drag/cardview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Drag(),
      );
}

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  List listA = [
    "assets/images/1_1@4X.png",
    "assets/images/1@4X.png",
    "assets/images/1_2@4X.png"
  ];
  List listB = [
    "assets/images/1_1@4X.png",
    "assets/images/1_3@4X.png",
  ];
  List listc = [
    "assets/images/1_1@4X.png",
    "assets/images/1_3@4X.png",
    "assets/images/1@4X.png"
  ];
  double widthvalue = 15;
  bool widthSize = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[200],
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
                // height: 400,
                //color: Color(0xFFE1F5FE),
                width: MediaQuery.of(context).size.width,
                child: CardView()),
//            list view separated will build a widget between 2 list items to act as a separator
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   // height: 150,
            //   color: Colors.white,
            //   child: SizedBox(
            //     // width: 150,
            //     height: 175,
            //     child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: _buildListAItems,
            //       separatorBuilder: _buildDragTargetsA,
            //       itemCount: listA.length,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // Row(
            //   children: [
            //     GestureDetector(
            //       child: Container(
            //         height: 50,
            //         width: 50,
            //         child: Icon(
            //           Icons.edit,
            //           color: Colors.black,
            //         ),
            //       ),
            //       onTap: () {
            //         setState(() {
            //           widthvalue = widthvalue == 16 ? 32 : 16;
            //         });
            //       },
            //     ),
            //   ],
            // ),
            // SizedBox(height: 15),

            // Container(
            //     color: Colors.white,
            //     width: MediaQuery.of(context).size.width,
            //     height: 175,
            //     child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: _buildListBItems,
            //       separatorBuilder: _buildDragTargetsB,
            //       itemCount: listB.length,
            //     )),
          ],
        ),
      ),
    );
  }

//  builds the widgets for List B items
  Widget _buildListBItems(BuildContext context, int index) {
    return Draggable<String>(
//      the value of this draggable is set using data
      data: listB[index],
//      the widget to show under the users finger being dragged
      feedback: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            listB[index],
            height: 150,
            width: 100,
          ),
          // Text(
          //   listB[index],
          //   style: TextStyle(fontSize: 20),
          // ),
        ),
      ),
//      what to display in the child's position when being dragged
      childWhenDragging: Container(
        color: Colors.white12,
        width: 40,
        height: 40,
      ),
//      widget in idle state
      child: Container(
        height: 100,
        width: 100,
        child: Image.asset(
          listB[index],
        ),
      ),
    );
  }

//  builds the widgets for List A items
  Widget _buildListAItems(BuildContext context, int index) {
    return Draggable<String>(
      //axis: Axis.horizontal,
      data: listA[index],
      feedback: Card(
        child: Image.asset(
          listA[index],
          height: 150,
          width: 100,
        ),
        // Text(
        //   listA[index],
        //   style: TextStyle(fontSize: 20),
        // ),
      ),
      // childWhenDragging: Container(
      //   width: MediaQuery.of(context).size.width,
      //   color: Colors.grey,
      // ),
      child: Container(
        height: 100,
        width: 100,
        // color: Colors.red,
        child: Image.asset(
          listA[index],
        ),
        // Text(
        //   listA[index],
        //   style: TextStyle(fontSize: 20),
        // ),
      ),
    );
  }

//  will return a widget used as an indicator for the drop position
  Widget _buildDropPreview(BuildContext context, String value) {
    return Container(
      height: 5,
      width: 100,
      color: Colors.lightBlue[200],
      child: Image.asset(
        value,
        height: 50,
      ),
    );
  }

//  builds DragTargets used as separators between list items/widgets for list A
  Widget _buildDragTargetsA(BuildContext context, int index) {
    return DragTarget<String>(
//      builder responsible to build a widget based on whether there is an item being dropped or not
      builder: (context, candidates, rejects) {
        return candidates.length > 0
            ? _buildDropPreview(context, candidates[0]!)
            : Container(
                // color: Colors.green,
                width: widthvalue,
                height: 5,
              );
      },
//      condition on to accept the item or not
      onWillAccept: (value) => !listA.contains(value),
//      what to do when an item is accepted
      onAccept: (value) {
        setState(() {
          listA.insert(index + 1, value);
          listB.remove(value);
        });
      },
    );
  }

//  builds drag targets for list B
  Widget _buildDragTargetsB(BuildContext context, int index) {
    return DragTarget<String>(
      builder: (context, candidates, rejects) {
        return candidates.isNotEmpty
            ? _buildDropPreview(context, candidates[0]!)
            : Container(
                width: 15,
                height: 5,
              );
      },
      onWillAccept: (value) => !listB.contains(value),
      onAccept: (value) {
        setState(() {
          listB.insert(index + 1, value);
          listA.remove(value);
        });
      },
    );
  }
}
