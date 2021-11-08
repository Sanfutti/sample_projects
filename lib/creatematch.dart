import 'package:flutter/material.dart';

class CreateMatch extends StatefulWidget {
  const CreateMatch({Key? key}) : super(key: key);

  @override
  _CreateMatchState createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  late bool _isSwitched;
  late bool boolDivider;
  late bool boolRow;
  late double heightContainer;
  late double heightCard;
  @override
  void initState() {
    super.initState();
    _isSwitched = false;
    boolDivider = false;
    boolRow = false;
    heightContainer = 0.0;
    heightCard = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    if (_isSwitched) {
      heightContainer = height * 0.43;
      heightCard = height * 0.18;
    } else {
      heightContainer = height * 0.36; //0.43
      heightCard = height * 0.102;
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/asimagess.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: heightContainer, //36
            width: width,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Color(0xFFD2DCE8),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 0.02),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    //color: Colors.blue,
                    height: height * 0.102,
                    width: 500,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 70,
                            margin: EdgeInsets.only(left: 10),
                            child: Text("Tempo de partida",
                                style: TextStyle(
                                  fontFamily: "Nunito-Bold",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF153E7D),
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 1.0,
                                      color: Colors.black,
                                    )
                                  ],
                                )),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                margin: EdgeInsets.only(left: width * 0.17),
                                child: Image.asset(
                                  "assets/images/asimagess.jpg",
                                  height: 35,
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green,
                            ),
                            margin: EdgeInsets.only(left: 10, right: 10),
                            alignment: Alignment.center,
                            width: width * 0.13,
                            height: 35,
                            child: Text("00:00",
                                style: TextStyle(
                                  fontFamily: "Nunito-Bold",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 5.0,
                                      color: Colors.black,
                                    ),
                                  ],
                                )),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                child: Image.asset(
                              "assets/images/asimagess.jpg",
                              height: 35,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 0.02),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    //color: Colors.blue,
                    height: heightCard, //0.102
                    width: width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text("Apostas",
                                    style: TextStyle(
                                      fontFamily: "Nunito-Bold",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF153E7D),
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 1.0,
                                          color: Colors.black,
                                        )
                                      ],
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: width * 0.49),
                                child: Transform.scale(
                                  alignment: Alignment.center,
                                  scale: 2.0,
                                  child: Switch(
                                    onChanged: (bool val) {
                                      print(_isSwitched);
                                      setState(() {
                                        _isSwitched = val;
                                      });
                                      print(_isSwitched);
                                      if (_isSwitched == true) {
                                        setState(() {
                                          boolDivider = true;
                                          boolRow = true;
                                          heightContainer = height * 0.43;
                                          heightCard = height * 0.18;
                                        });
                                      } else {
                                        setState(() {
                                          boolDivider = false;
                                          boolRow = false;
                                          heightContainer = height * 0.36;
                                          heightCard = height * 0.102;
                                        });
                                      }
                                    },
                                    value: _isSwitched,
                                    // activeThumbImage: AssetImage(
                                    //     "assets/images/asimagess.jpg"),
                                    // inactiveThumbImage: AssetImage(
                                    //     "assets/images/asimagess.jpg"),
                                    activeColor: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: boolDivider,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 5),
                              child: Divider(
                                color: Colors.blue,
                                thickness: 2,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: boolRow,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text("Valor",
                                      style: TextStyle(
                                        fontFamily: "Nunito-Bold",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF153E7D),
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 1.0,
                                            color: Colors.black,
                                          )
                                        ],
                                      )),
                                ),
                                Stack(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.30),
                                          child: Image.asset(
                                            "assets/images/asimagess.jpg",
                                            height: 35,
                                          )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green,
                                      ),
                                      margin: EdgeInsets.only(
                                          left: width * 0.4, right: 10),
                                      alignment: Alignment.center,
                                      width: width * 0.23,
                                      height: 35,
                                      child: Text("1000",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Nunito-Bold",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(1.0, 1.0),
                                                blurRadius: 5.0,
                                                color: Colors.black,
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () => print('hello'),
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          height: 50.0,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/asimagess.jpg"),
                                fit: BoxFit.cover),
                            //color: green,
                            //border: Border.all(color: Colors.lightGreenAccent, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'Voltar',
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => print('hello'),
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          height: 50.0,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/asimagess.jpg"),
                                fit: BoxFit.cover),
                            //color: green,
                            //border: Border.all(color: Colors.lightGreenAccent, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'Jogar',
                              style: TextStyle(
                                fontFamily: 'Nunito-Bold',
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
