import 'package:flutter/material.dart';
import 'package:planet_x/ui/DetailScreen.dart';

String planetname;
String moonnumber;
String Distancesun;
int introselecter;
String intro;
String dist;

String earthtwo = "images/earthtwo.png";

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new home();
  }
}

class home extends State {
  double _calculatedWeight = 00;
  final TextEditingController _weight = new TextEditingController();
  int selected;
  bool viewcontent = false;
  String outputString = "Enter a value and select a Planet";
  String cleanOutput = "Enter a value and select a Planet";
  int imageSelector = 0;
  String earth = "images/earth.png";
  String source = "images/earth.png";
  String mars = "images/mars.png";
  String jupiter = "images/jupiter.png";
  String moon = "images/moon.png";
  String saturn = "images/saturn.png";
  String venus = "images/venus.png";
  String neptune = "images/neptune.png";
  String mercury = "images/mercury.png";
  String uranus = "images/uranus.png";

  void clean() {
    setState(() {
      selected = null;
      viewcontent = false;
      outputString = cleanOutput;
      _weight.clear();
      source = earth;
    });
  }

  void selectMethod(int value) {
    setState(() {
      selected = value;
      switch (value) {
        case 0:
          source = mercury;
          Data().planetInfo(1, "Mercury", "0", "57.9 million km", 30000);
          calculate(_weight.text, .38);
          break;
        case 1:
          source = venus;
          Data().planetInfo(2, "Venus", "0", "108.2 million km", 30000);
          calculate(_weight.text, .904);
          break;
        case 2:
          source = moon;
          Data()
              .planetInfo(3, "Moon", "Not a Planet", "149.6 million km", 30000);
          calculate(_weight.text, 0.165);
          break;
        case 3:
          source = mars;
          Data().planetInfo(4, "Mars", "2", "227.9 million km", 30000);
          calculate(_weight.text, 0.71);
          break;
        case 4:
          source = jupiter;
          Data().planetInfo(5, "Jupiter", "67", "778.3 million km", 30000);
          calculate(_weight.text, 2.528);
          break;
        case 5:
          source = saturn;
          Data().planetInfo(6, "Saturn", "62", "1,427.0 million km", 30000);
          calculate(_weight.text, 1.065);
          break;
        case 6:
          source = uranus;
          Data().planetInfo(7, "Uranus", "27", "2,871.0 million km", 30000);
          calculate(_weight.text, 0.886);
          break;
        case 7:
          source = neptune;
          Data().planetInfo(8, "Neptune", "14", "4,497.1 million km", 30000);
          calculate(_weight.text, 1.14);
          break;
      }
    });
  }

  void wrongInput() {
    setState(() {
      outputString = "Please enter valid input";
      viewcontent = false;
    });
  }

  void calculate(String inputweight, double multiplier) {
    if (inputweight.isNotEmpty && double.parse(inputweight) > 0) {
      _calculatedWeight = double.parse(inputweight) * multiplier;
      outputString = "Your weight on this planet is $_calculatedWeight Kgs.";
      viewcontent = true;
    } else
      wrongInput();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Weight on Planet X",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueGrey.shade800,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade500,
        body: new Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.grey[300],
                Colors.grey[400],
                Colors.grey[500],
              ],
            ),
          ),
          alignment: Alignment.topCenter,
          child: new ListView(padding: EdgeInsets.all(5.0), children: <Widget>[
            Padding(padding: EdgeInsets.all(15)),
            new Image.asset(
              source,
              height: 190,
              width: 350,
            ),
            new Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    controller: _weight,
                    decoration: new InputDecoration(
                      hintText: "Enter your weight in Kgs",
                      labelText: "Your weight on Earth",
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      icon: new Icon(Icons.nature_people),
                    ),
                    onTap: clean,
                    enabled: true,
                    keyboardType: TextInputType.number,
                  )
                ],
              ),
            ),
            new Padding(
                padding: const EdgeInsets.only(right: 0),
                child: new Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: new SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(0)),
                            new Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio<int>(
                                    value: 0,
                                    groupValue: selected,
                                    activeColor: Colors.orangeAccent.shade200,
                                    onChanged: selectMethod,
                                  ),
                                  new Text(
                                    "Mercury",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            new Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio<int>(
                                    value: 1,
                                    groupValue: selected,
                                    activeColor: Colors.orange.shade600,
                                    onChanged: selectMethod,
                                  ),
                                  new Text(
                                    "Venus",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            new Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Radio<int>(
                                    value: 2,
                                    groupValue: selected,
                                    activeColor: Colors.white70,
                                    onChanged: selectMethod,
                                  ),
                                  new Text(
                                    "Moon",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            new Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio<int>(
                                    value: 3,
                                    groupValue: selected,
                                    activeColor: Colors.red.shade900,
                                    onChanged: selectMethod,
                                  ),
                                  new Text(
                                    "Mars",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            new Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio<int>(
                                    value: 4,
                                    groupValue: selected,
                                    activeColor: Colors.brown.shade400,
                                    onChanged: selectMethod,
                                  ),
                                  new Text(
                                    "Jupiter",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            new Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio<int>(
                                    value: 5,
                                    groupValue: selected,
                                    activeColor: Colors.amber.shade300,
                                    onChanged: selectMethod,
                                  ),
                                  new Text(
                                    "Saturn",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            new Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio<int>(
                                    value: 6,
                                    groupValue: selected,
                                    activeColor: Colors.lightBlue.shade100,
                                    onChanged: selectMethod,
                                  ),
                                  new Text(
                                    "Uranus",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            new Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Radio<int>(
                                    value: 7,
                                    groupValue: selected,
                                    activeColor: Colors.blue.shade800,
                                    onChanged: selectMethod,
                                  ),
                                  new Text(
                                    "Neptune",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                          ])),
                )),
            new Container(
              margin: EdgeInsets.only(top: 50, left: 10, right: 10),
              alignment: Alignment.topCenter,
              child: ExpansionTile(
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: viewcontent
                              ? Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4.0, top: 4),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      textDirection: TextDirection.ltr,
                                      children: <Widget>[
                                        Text(
                                          "$planetname",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 5),
                                          child: Text(
                                            "About:",
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4.0, bottom: 2),
                                          child: Text(
                                            "$intro",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        new Wrap(
                                          runAlignment: WrapAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0, bottom: 2),
                                              child: Text(
                                                "No. of Moons: $moonnumber",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0, bottom: 2),
                                              child: Text(
                                                "Distance from Sun: $dist",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 10, 5, 20),
                                              alignment: Alignment.centerRight,
                                              child: new RaisedButton(
                                                  color: Colors.grey.shade800,
                                                  elevation: 5,
                                                  splashColor: Colors.white70,
                                                  child: Text(
                                                    "More Details",
                                                    style:
                                                        TextStyle(fontSize: 16, color: Colors.grey.shade400),
                                                  ),
                                                  onPressed: () {
                                                    var nextPages =
                                                        MaterialPageRoute(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return DetailScreen(
                                                        planetDetail:
                                                            planetname,
                                                      );
                                                    });
                                                    Navigator.of(context)
                                                        .push(nextPages);
                                                  }),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Text(
                                  "Please enter your weight and select a planet to view detailed information!",
                                  style: TextStyle(fontSize: 18),
                                ),
                        )
                      ]),
                ],
                title: Text(
                  "$outputString",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            )
          ]),
        ));
  }

//  Future nextPage(BuildContext context) async{
//    Map details = await Navigator.of(context).push( MaterialPageRoute<Map> (builder: (BuildContext context)
//    {return NextScreen()}));
//  }
}

class Data {
  void planetInfo(
    int sel,
    String name,
    String moonnums,
    String distant,
    double days,
  ) {
    moonnumber = moonnums;
    planetname = "$name";
    dist = distant;
    switch (sel) {
      case 1:
        intro = "Mercury is the smallest planet in our solar system. "
            "Along with Venus, Earth, and Mars, Mercury is one of "
            "the rocky planets. It has a solid surface that is covered with craters. "
            "It has a thin atmosphere, and it doesn't have any moons.";
        break;
      case 2:
        intro = "Venus is the second planet from the Sun, o"
            "rbiting it every 224.7 Earth days. It has the longest rotation period of "
            "any planet in the Solar System and rotates in the opposite direction to most other planets. "
            "It does not have any natural satellites."
            " It is named after the Roman goddess of love and beauty.";
        break;
      case 3:
        intro =
            "The Moon is an astronomical body that orbits planet Earth and is Earth's only permanent nat"
            "ural satellite. It is the fifth-largest natural satellite in the Solar System"
            ", and the largest among planetary satellites relative to the size of the planet that it orbits.";
        break;
      case 4:
        intro =
            "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System af"
            "ter Mercury. In English, Mars carries a name of the Roman god of war, and is often referred to as "
            "the \"Red Planet\" because the reddish iron oxide prevalent on its surface gives it a reddish appearance. "
            "Mars is the site of Olympus Mons, the largest volcano and second-highest known mountain in"
            " the Solar System, and of Valles Marineris, one of the largest canyons in the Solar System";
        break;
      case 5:
        intro =
            "Jupiter is the fifth planet from the Sun and the largest in the Solar System."
            " It is a giant planet with a mass one-thousandth that of the S"
            "un, but two-and-a-half times that of all the other planets in the Solar System combined. "
            "Jupiter is a Gas Giant as it is primarily composed of hydroge"
            "n with a quarter of its mass being helium. Jupiter has been explored on several occasions by robotic spacecraft, most notably "
            "during the early Pioneer and Voyager flyby missions and later by the Galileo orbiter.";
        break;
      case 6:
        intro =
            "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, af"
            "ter Jupiter. It is a gas giant with an average radius about nine times that of Earth. It has only one-eighth the avera"
            "ge density of Earth, but with its larger volume Saturn is over 95 times more massive.";
        break;
      case 7:
        intro =
            "Uranus is the seventh planet from the Sun. It has the third-largest planetary rad"
            "ius and fourth-largest planetary mass in the Solar System. Uranus is similar in composition to Neptune, and both have bul"
            "k chemical compositions which differ from that of the larger gas giants Jupiter and Saturn.";
        break;
      case 8:
        intro =
            "Neptune is the eighth and farthest known planet from the Sun in the Solar System. In the Sol"
            "ar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet."
            " Neptune is 17 times the mass of Earth, slightly more massive than its near-twin Uranus.";
    }
  }
}
