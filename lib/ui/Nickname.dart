import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'DetailScreen.dart' as Detail;

var NickNameconstant = TextEditingController();

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
          title: new Text(
        "User Setting",
      )),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: new InputDecoration(
                hintText: "In less than 20 letters!",
                labelText: "Enter Nick Name for your planet:",
              ),
              controller: NickNameconstant,
              textCapitalization: TextCapitalization.words,
              maxLength: 20,
              onTap: () {
                NickNameconstant.clear();
              },
            ),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(12),
                child: RaisedButton(
                  color: Colors.grey,
                  onPressed: () {
                    writeData(NickNameconstant.text);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text("Save and Return Home"),
                )),
          ],
        ),
      ),
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get localFile async {
  final path = await _localPath;
  return new File("$path/" + "${Detail.PlanetNames}" + ".txt");
}

Future<File> writeData(String nickName) async {
  final file = await localFile;
  return file.writeAsString("$nickName");
}
