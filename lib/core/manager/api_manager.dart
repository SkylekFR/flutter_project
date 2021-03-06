import 'package:dio/dio.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  Dio dio;

  ApiManager._internal() {
    dio = Dio();
    dio.options.baseUrl =
    "https://api.spacexdata.com/v4/";
  }

  Future<Response<List<dynamic>>> getUpcomingLaunches() async =>
      await dio.get<List<dynamic>>("launches/upcoming");

  Future<Response<List<dynamic>>> getAllLaunchpads() async =>
      await dio.get<List<dynamic>>("launchpads");

  Future<Response<List<dynamic>>> getPastLaunches() async =>
      await dio.get<List<dynamic>>("launches/past");

  Future<Response<dynamic>> getCompanyInfo() async =>
      await dio.get<dynamic>("company");
}