import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'model/tile_model.dart';
import 'data/data.dart';

class ParPage extends StatefulWidget {
  @override
  _ParPageState createState() => _ParPageState();
}

class _ParPageState extends State<ParPage> {
  List<TileModel> gridViewTiles = new List<TileModel>();
  List<TileModel> questionPairs = new List<TileModel>();

  final CountdownController controller = CountdownController();
  bool _isPause = true;

  @override
  void initState() {
    super.initState();
    reStart();
  }

  //Método  Iniciar
  void reStart() {
    myPairs = getPairs();
    //Random de las imagenes
    myPairs.shuffle();

    gridViewTiles = myPairs;

    //Temporizador de la imagen
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        print("2 seconds");
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage("images/games/JUEGO-PAREJAS_HORIZONTAL.jpg"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: <Widget>[
                  points != 800
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[],
                        )
                      : Container(),
                  points != 800
                      ? Column(
                          children: [
                            Center(
                              child: Countdown(
                                controller: controller,
                                seconds: 60,
                                build: (_, double time) => Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.deepOrangeAccent,
                                    ),
                                    child: Center(
                                        child: Text(
                                      time.toString(),
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ))),
                                interval: Duration(
                                  milliseconds: 100,
                                ),
                                onFinished: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              LosePageHorizontal()));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: GridView.count(
                                shrinkWrap: true,
                                //physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                mainAxisSpacing: 0.0,
                                crossAxisCount: 8,
                                children: List.generate(gridViewTiles.length,
                                    (index) {
                                  return Tile(
                                    imagePathUrl: gridViewTiles[index]
                                        .getImageAssetPath(),
                                    tileIndex: index,
                                    parent: this,
                                  );
                                }),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 150, top: 30, right: 30),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.deepOrangeAccent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 40),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(
                                        "Lo has completado, pero seguro que puedes hacerlo mejor",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          //Al momento que da click  si no encuentra la pareja reinicia
                                          setState(() {
                                            points = 0;
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => ParPage()));
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 200,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "Volver a empezar",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                ],
              ),
            ),
          ),
        ));
  }
}

class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _ParPageState parent;

  Tile({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //FlutterBeep.playSysSound(43);
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// probar si las parejas seleccionados son iguales
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
              print("añadir puntos");
              points = points + 100;
              print(selectedTile + "thishis" + widget.imagePathUrl);

              TileModel tileModel = new TileModel();
              print(widget.tileIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = tileModel;
                print(selectedIndex);
                myPairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                //FlutterBeep.beep();
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  myPairs[widget.tileIndex].getImageAssetPath());
              print("Mala decisión");
              print(widget.tileIndex);
              print(selectedIndex);
              //FlutterBeep.beep(false);
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                ? myPairs[widget.tileIndex].getImageAssetPath()
                : widget.imagePathUrl)
            : Container(
                color: Colors.white,
                child: Image.asset("images/correct.png"),
              ),
      ),
    );
  }
}

class LosePageHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("images/games/JUEGO-PAREJAS_HORIZONTAL.jpg"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 100, right: 50),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.2,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.deepOrangeAccent,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Se acabó el tiempo, esfuerzate un poco más",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            //Al momento que da click  si no encuentra la pareja reinicia
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => ParPage()));
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Volver a empezar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
