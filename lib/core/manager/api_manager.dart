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
}