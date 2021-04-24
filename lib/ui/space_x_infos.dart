import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_project/core/manager/api_manager.dart';
import 'package:flutter_project/core/manager/company_manager.dart';
import 'package:flutter_project/core/manager/launch_manager.dart';
import 'package:flutter_project/core/model/company.dart';
import 'package:flutter_project/core/model/launch.dart';
import 'package:flutter_project/ui/launch_detail.dart';

class SpaceXInfos extends StatefulWidget {
  SpaceXInfos({Key key}) : super(key: key);

  @override
  _SpaceXInfos createState() => _SpaceXInfos();
}

class _SpaceXInfos extends State<SpaceXInfos> {
  Company company = Company();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Company>(
        future: CompanyManager().getCompanyInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            company = snapshot.data;
        return Scaffold(
        appBar: AppBar(
          title: Text(company.name),
        ),
           body: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(

                        "The company has been founded by ${company.founder} in ${company.founded}. The company is hiring ${company.employees} employees",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: 1.25,
                      ),
                      SizedBox(
                        height: 8,
                      ),

                      Text(
                        "Valuation: \$${company.valuation}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: 1.25,
                      ),
                      Text(
                        "Launch Sites: ${company.launchSites}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: 1.25,
                      ),
                      Text(
                        "Vehicles: ${company.vehicles}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: 1.25,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "${company.summary}",
                        textScaleFactor: 1.25,
                      ),
                    ],
                  ),
                )));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
  }
}
