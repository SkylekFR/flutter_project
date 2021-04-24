import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/core/model/company.dart';
import 'package:flutter_project/core/model/launch.dart';

import 'api_manager.dart';

class CompanyManager {
  static final CompanyManager _instance = CompanyManager._internal();

  factory CompanyManager() => _instance;

  CompanyManager._internal();

  Future<Company> getCompanyInfo() async {
    Company company = Company();
    // Calling API
    try {
      var response = await ApiManager().getCompanyInfo();
      if (response != null && response.data != null) {
        // Mapping data
        company = Company.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return company;
  }
}
