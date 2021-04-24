import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/model/launch.dart';
import 'package:intl/intl.dart';

class LaunchDetail extends StatefulWidget {
  LaunchDetail({@required this.launch, Key key}) : super(key: key);

  final Launch launch;

  @override
  _LaunchDetailState createState() => _LaunchDetailState(launch);
}

class _LaunchDetailState extends State<LaunchDetail> {
  Launch launch;

  _LaunchDetailState(Launch launch) {
    this.launch = launch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.launch.name),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              launch.links.patch.small ?? "no image",
              errorBuilder: (context, object, stacktrace) {
                if (Platform.isIOS) {
                  return Icon(CupertinoIcons.doc_plaintext);
                } else {
                  return Icon(Icons.add_photo_alternate_outlined);
                }
              },
            ),
            Expanded(

              child: SingleChildScrollView(
                child:
                Padding(padding: EdgeInsets.all(8),
                child: Text(
                  launch.details ?? "Pas de description",
                  textScaleFactor: 1.5,
                ),
              ),
            )),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom.sign),
              child: Text(
              "Lancement: ${DateFormat().format(DateTime.parse(launch.dateUtc))}",
              textScaleFactor: 1.25,
            ),)

          ],
        ),
      ),
    );
  }
}
