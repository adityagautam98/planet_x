import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'Nickname.dart';

String PlanetNames;
String planetPic;
int planetSelect;
String planetchar;
String planetInfo;

class DetailScreen extends StatefulWidget {
  final planetDetail;

  DetailScreen({
    Key key,
    this.planetDetail,
  }) : super(key: key);

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  String ReadData;
  String callback;
  String pname = PlanetNames;

  @override
  void initState() {
    super.initState();
    readData().then((String value) {
      setState(() {
        setInfo();
        PlanetNames = widget.planetDetail;
        ReadData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade800,
          title: Text("Details"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  var nextPages2 =
                      MaterialPageRoute(builder: (BuildContext context) {
                    return AboutUs();
                  });
                  Navigator.of(context).push(nextPages2);
                })
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.7, 0.95],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.grey[300],
                Colors.grey[400],
                Colors.grey[500],
              ],
            ),
          ),
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                Center(
                    child: Text(
                  "${widget.planetDetail}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 34),
                )),
                Image.asset(
                  "$planetPic",
                  width: 200,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "$ReadData",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Text(
                        "(Nick Name)",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: Text("Introduction",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),
                    initiallyExpanded: true,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            "$planetInfo",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0, left: 8, right: 8, bottom: 40),
                  child: ExpansionTile(
                    title: Text("Physical Characteristics",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),
                    initiallyExpanded: false,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            "$planetchar",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ))
                    ],
                  ),
                )
              ]),
            ),
          ]),
        ));
  }

  void setReceivedValue() async {
    String Data = await readData();
    if (Data != null) {
      setState(() {
        ReadData = Data;
      });
    }
  }

  Future<String> get _localPath async {
    PlanetNames = widget.planetDetail;
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get localFile async {
    PlanetNames = widget.planetDetail;
    final path = await _localPath;
    return new File("$path" + "/" + "$PlanetNames" + ".txt");
  }

  Future<File> writeData(String nickName) async {
    final file = await localFile;
    return file.writeAsString("$nickName");
  }

  Future<String> readData() async {
    try {
      final file = await localFile;
      String entereddata = await file.readAsString();
      return entereddata;
    } catch (e) {
      return "Enter Nick Name through Setting.\nEach planet can have its own nick name.";
    }
  }
}

void setInfo() {
  switch (PlanetNames) {
    case "Mercury":
      planetInfo =
          "Mercury is the closest planet to the sun. As such, it circles the sun faster than all"
          " the other planets, which is why Romans named it after their swift-footed messenger god. The Sumerians also "
          "knew of Mercury since at least 5,000 years ago. It was often associated with Nabu, the god of writing. Mercury was also giv"
          "en separate names for its appearance as both a morning star and as an evening star. Greek astronomers knew, however, that the"
          " two names referred to the same body, and Heraclitus, around 500 B.C., correctly thought that both Mercury and Venus orbited"
          " the sun, not Earth.";
      planetPic = "images/mercury.png";
      planetchar = "Mercury appears to have a solid silicate crust and mantle overlying a solid, iron sulfide outer core layer, "
          "a deeper liquid core layer, and a solid inner core. Geologists estimate that Mercury's core occupies about 55% of its volume; for Earth this propor"
          "tion is 17%. Research published in 2007 suggests that Mercury has a molten core.";
      break;
    case "Venus":
      planetInfo =
          "Venus, the second planet from the sun, is named for the Roman goddess of love and beauty. "
          "The planet Venus — the only planet named after a female — may have been named for the most beautiful deity of her "
          "pantheon because it shone the brightest of the five planets known to ancient astronomers. In ancient times, Venus was often"
          " thought to be two different stars, the evening star and the morning star — that is, the ones that first appeared at sun"
          "set and sunrise. In Latin, they were respectively known as Vesper and Lucifer. Venus is a very difficult planet to observe f"
          "rom up close, because spacecraft do not survive long on its surface.";
      planetPic = "images/venus.png";
      planetchar = "Venus is one of the four terrestrial planets in the Solar System, meaning that it is a rocky body like Earth. It "
          "is similar to Earth in size and mass, and is often described as Earth's \"sister\" or \"twin\". Conditions on the Venusian s"
          "urface differ radically from those on Earth because its dense atmosphere is 96.5% carbon dioxide, with most of the remaining 3.5% being nitrogen.";
      break;

    case "Moon":
      planetInfo =
          "Earth's Moon is the only place beyond Earth where humans have set foot. The brightest and largest obj"
          "ect in our night sky, the Moon makes Earth a more livable planet by moderating our home planet's wobble on its axis, leading t"
          "o a relatively stable climate. It also causes tides, creating a rhythm that has guided humans for thousands of years. The Moon wa"
          "s likely formed after a Mars-sized body collided with Earth.Our moon is the fifth largest of the 190+ moons orbiting planets in o"
          "ur solar system. Earth's only natural satellite is simply called \"the Moon\" because people didn't know other moons existed un"
          "til Galileo Galilei discovered four moons orbiting Jupiter in 1610.";
      planetPic = "images/moon.png";
      planetchar = "The Moon is a differentiated body. It has a geochemically distinct crust, mantle, and core. The Moon has a solid"
          " iron-rich inner core with a radius possibly as small as 240 kilometres (150 mi) and a fluid outer core primarily made of li"
          "quid iron with a radius of roughly 300 kilometres (190 mi).";
      break;
    case "Mars":
      planetInfo =
          "The fourth planet from the Sun, Mars is a dusty, cold, desert world with a very thin atmosphere. Th"
          "is dynamic planet has seasons, polar ice caps and weather and canyons and extinct volacanoes, evidence of an even more act"
          "ive past. Mars is one of the most explored bodies in our solar system, and it's the only planet where we've sent rovers to ro"
          "am the alien landscape. NASA currently has three spacecraft in orbit, one rover on the surface and another rover under constru"
          "ction here on Earth. India and ESA also have spacecraft in orbit above the Mars. These robotic explorers have found lots of e"
          "vidence that Mars was much wetter and warmer, with a thicker atmosphere, billions of years ago.";
      planetPic = "images/mars.png";
      planetchar = "Mars is approximately half the diameter of Earth, with a surface area only slightly less than the total area of Earth's dry land."
          " Mars is less dense than Earth, having about 15% of Earth's volume and 11% of Earth's mass, resulting in about 38% of Earth's surface gravity.";
      break;
    case "Jupiter":
      planetInfo =
          "Jupiter has a long history surprising scientists—all the way back to 1610 when Galileo Galilei foun"
          "d the first moons beyond Earth. That discovery changed the way we see the universe. Fifth in line from the Sun, Jupiter is, b"
          "y far, the largest planet in the solar system – more than twice as massive as all the other planets combined. Jupiter's famili"
          "ar stripes and swirls are actually cold, windy clouds of ammonia and water, floating in an atmosphere of hydrogen and helium."
          " Jupiter’s iconic Great Red Spot is a giant storm bigger than Earth that has raged for hundreds of years. One spacecraft — "
          "NASA's Juno orbiter — is currently exploring this giant world.";
      planetPic = "images/jupiter.png";
      planetchar =
          "Jupiter is composed primarily of gaseous and liquid matter. It is the largest of the four giant planets in the Sol"
          "ar System and hence its largest planet. It has a diameter of 142,984 km (88,846 mi) at its equator. The average density of J"
          "upiter, 1.326 g/cm3, is the second highest of the giant planets, but lower than those of the four terrestrial planets.";
      break;
    case "Saturn":
      planetInfo =
          "Saturn is the sixth planet from the Sun and the second largest planet in our solar system. Adorned wit"
          "h thousands of beautiful ringlets, Saturn is unique among the planets. It is not the only planet to have rings—made of chunks"
          " of ice and rock—but none are as spectacular or as complicated as Saturn's. Like fellow gas giant Jupiter, Saturn is a massiv"
          "e ball made mostly of hydrogen and helium.";
      planetchar = "Saturn is a gas giant because it is predominantly composed of hydrogen and helium. It lacks a definite surface, though i"
          "t may have a solid core. Saturn's rotation causes it to have the shape of an oblate spheroid; that is, it is flattened at the poles and bulges at its equator.";
      planetPic = "images/saturn.png";
      break;
    case "Uranus":
      planetInfo =
          "The first planet found with the aid of a telescope, Uranus was discovered in "
          "1781 by astronomer William Herschel, although he originally thought it was either a comet or a star. It was two years later t"
          "hat the object was universally accepted as a new planet, in part because of observations by astronomer Johann Elert Bode. Her"
          "schel tried unsuccessfully to name his discovery Georgium Sidus after King George III. Instead the planet was named for Uranu"
          "s, the Greek god of the sky, as suggested by Johann Bode.​";
      planetPic = "images/uranus.png";
      planetchar = "Uranus' mass is roughly 14.5 times that of Earth, making it the least massive of the giant planets. Its diameter "
          "is slightly larger than Neptune's at roughly four times that of Earth. A resulting density of 1.27 g/cm3 makes Uranus the second least dense planet, after Saturn.";

      break;

    case "Neptune":
      planetInfo =
          "Dark, cold and whipped by supersonic winds, ice giant Neptune is the eighth and most distant planet in"
          " our solar system. More than 30 times as far from the Sun as Earth, Neptune is the only planet in our solar system not visible"
          " to the naked eye and the first predicted by mathematics before its discovery. In 2011 Neptune completed its first 165-year or"
          "bit since its discovery in 1846. NASA's Voyager 2 is the only spacecraft to have visited Neptune up close. It flew past in 198"
          "9 on its way out of the solar system.";
      planetPic = "images/neptune.png";
      planetchar = "Neptune's internal structure resembles that of Uranus. Its atmosphere forms about 5% to 10% of its mass and extends"
          " perhaps 10% to 20% of the way towards the core, where it reaches pressures of about 10 GPa, or about 100,000 times that of "
          "Earth's atmosphere. Increasing concentrations of methane, ammonia and water are found in the lower regions of the atmosphere.";

      break;
  }
}
