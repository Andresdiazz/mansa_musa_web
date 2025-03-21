import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mansamusa_web/Games/trivia/resultpage.dart';

class getjson extends StatelessWidget {
  // accept the langname as a parameter

  //String langname;
  //getjson(this.langname);
  String assettoload;

  // a function
  // sets the asset to a particular JSON file
  // and opens the JSON
  setasset() {
    assettoload = "images/question.json";
    /*if (langname == "Python") {
      
    } else if (langname == "Java") {
      assettoload = "assets/java.json";
    } else if (langname == "Javascript") {
      assettoload = "assets/js.json";
    } else if (langname == "C++") {
      assettoload = "assets/cpp.json";
    } else {
      assettoload = "assets/linux.json";
    }*/
  }

  @override
  Widget build(BuildContext context) {
    // this function is called before the build so that
    // the string assettoload is avialable to the DefaultAssetBuilder
    setasset();
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  var mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  var mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  // extra varibale to iterate
  int j = 1;
  int timer = 30;
  //String showtimer = "30";
  var random_array;

  Map<String, Color> btncolor = {
    "a": Colors.deepOrangeAccent,
    "b": Colors.deepOrangeAccent,
    "c": Colors.deepOrangeAccent,
    "d": Colors.deepOrangeAccent,
  };

  bool canceltimer = false;

  // code inserted for choosing questions randomly
  // to create the array elements randomly use the dart:math module
  // -----     CODE TO GENERATE ARRAY RANDOMLY

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(80));
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  //   var random_array;
  //   var distinctIds = [];
  //   var rand = new Random();
  //     for (int i = 0; ;) {
  //     distinctIds.add(rand.nextInt(10));
  //       random_array = distinctIds.toSet().toList();
  //       if(random_array.length < 10){
  //         continue;
  //       }else{
  //         break;
  //       }
  //     }
  //   print(random_array);

  // ----- END OF CODE
  // var random_array = [1, 6, 7, 2, 4, 10, 8, 3, 9, 5];

  // overriding the initstate function to start timer as this screen is created
  @override
  void initState() {
    //starttimer();
    genrandomarray();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  /*void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }*/

  void nextquestion() {
    //canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.deepOrangeAccent;
      btncolor["b"] = Colors.deepOrangeAccent;
      btncolor["c"] = Colors.deepOrangeAccent;
      btncolor["d"] = Colors.deepOrangeAccent;
    });
    //starttimer();
  }

  void checkanswer(String k) {
    // in the previous version this was
    // mydata[2]["1"] == mydata[1]["1"][k]
    // which i forgot to change
    // so nake sure that this is now corrected
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2][i.toString()] + " is equal to " + mydata[1][i.toString()][k]);
      marks = marks + 5;
      // changing the color variable to be green
      colortoshow = right;
      //FlutterBeep.playSysSound(43);
    } else {
      // just a print sattement to check the correct working
      // debugPrint(mydata[2]["1"] + " is equal to " + mydata[1]["1"][k]);
      colortoshow = wrong;
      //FlutterBeep.beep(false);
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      canceltimer = true;
    });

    // changed timer duration to 1 second
    Timer(Duration(seconds: 1), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => {
          checkanswer(k),
          //FlutterBeep.playSysSound(43)
        },
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          maxLines: 2,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 500.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Quizstar",
                  ),
                  content: Text("You Can't Go Back At This Stage."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        body: Container(
          width: 1400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/JUEGO-PREGUNTAS-horizontal.jpg"),
                  fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 400),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      mydata[0][i.toString()],
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          choicebutton('a'),
                          choicebutton('b'),
                          choicebutton('c'),
                          choicebutton('d'),
                        ],
                      ),
                    ),
                  ),
                ),
                /*Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Text(
                        showtimer,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
