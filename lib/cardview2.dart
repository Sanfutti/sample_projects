import 'package:flutter/material.dart';

class CardView2 extends StatefulWidget {
  const CardView2({Key? key}) : super(key: key);

  @override
  _CardView2State createState() => _CardView2State();
}

class _CardView2State extends State<CardView2> {
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
  double valuewidth = 20;
  bool widthSize = false;
  double x = 5;
  final List<Widget> _cards = [];
  final List<Widget> _cards2 = [];
  void _initCards() {
    double cardHeight = 150;
    double cardWidth = 100;

    for (int i = 0; i < listA.length; i++) {
      _cards.add(Positioned(
        left: ((i >= 10) ? i - 10 : i) * 20,
        top: 0,
        child: Container(
            //  width: cardWidth,
            // height: cardHeight,
            child: Row(
          children: [
            // _buildDragTargetsA(context, i),
            _buildListAItems(context, i),
          ],
        )
            // ListView.separated(
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: _buildListAItems,
            //   separatorBuilder: _buildDragTargetsA,
            //   itemCount: 1,
            // ),
            ),

        // Card(
        //   elevation: 10,
        //   color: Colors.white,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //   child: SizedBox(width: cardWidth, height: cardHeight),
        // ),
      ));
    }
  }
  // _buildListBItems,
  //  _buildDragTargetsB,

  void _initCards2() {
    double cardHeight = 250;
    double cardWidth = 200;
    for (int i = 0; i < listB.length; i++) {
      _cards2.add(Positioned(
        left: ((i >= 10) ? i - 10 : i) * 20,
        top: (i >= 10) ? 0.7 * cardHeight : 0,
        child: Container(
            width: cardWidth,
            height: cardHeight,
            child: Row(
              children: [
                _buildDragTargetsB(context, i),
                _buildListBItems(context, i),
              ],
            )
            // ListView.separated(
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: _buildListAItems,
            //   separatorBuilder: _buildDragTargetsA,
            //   itemCount: 1,
            // ),
            ),

        // Card(
        //   elevation: 10,
        //   color: Colors.white,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //   child: SizedBox(width: cardWidth, height: cardHeight),
        // ),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _initCards();
    _initCards2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(children: _cards2),
            decoration: const BoxDecoration(
                //color: Colors.yellow,
                ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                border: Border.all(
                  color: Colors.blue.shade100,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            //  margin: EdgeInsets.only(left: width * 0.49),
            child: IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
                size: 20.0,
              ),
              onPressed: () {
                setState(() {
                  // boolDivider = true;
                  // boolRow = false;
                  // heightContainer = height * 0.43;
                  // heightCard = height * 0.18;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListBItems(BuildContext context, int index) {
    return Draggable<String>(
//      the value of this draggable is set using data
      data: listB[index],
//      the widget to show under the users finger being dragged
      feedback: Image.asset(
        listB[index],
        height: 100,
        width: 80,
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
        width: 80,
        child: Image.asset(
          listB[index],
        ),
      ),
    );
  }

  Widget _buildListAItems(BuildContext context, int index) {
    x = index.toDouble();
    return Draggable<String>(
      //axis: Axis.horizontal,
      data: listA[index],
      feedback: Card(
        child: Image.asset(
          listA[index],
          height: 250,
          width: 200,
        ),
        // Text(
        //   listA[index],
        //   style: TextStyle(fontSize: 20),
        // ),
      ),
      childWhenDragging: Container(
        width: 40,
        height: 40,
        //color: Colors.white12,
      ),
      child: Container(
        height: 150,
        width: 150,
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
    double cardHeight = 400 / 2;
    double cardWidth = 2500 / 20;
    return Container(
      height: 100,
      width: 80,
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
          listA.insert(index, value);
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
          listB.insert(index, value);
          listA.remove(value);
        });
      },
    );
  }
}
