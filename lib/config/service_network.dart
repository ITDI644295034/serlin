import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/config/api.dart';
import 'package:flutter_application_3/model/popular_model.dart';
import 'package:flutter_application_3/model/toprate_mode.dart';
import 'package:flutter_application_3/model/upcoming_model.dart';
import 'package:flutter_application_3/model/vdo_model.dart';

class ServiceNetwork {
  final dio = Dio();

  Future<PoppularModel> getPopDio() async {
    final response = await dio.get(API.POP_URL);
    if (response.statusCode == 200) {
      print(response.data);
      print('POp');
      return poppularModelFromJson(jsonEncode(response.data));
    }
    throw Exception('Network TV Failed');
  }

  Future<UpcomingModel> getUpDio() async {
    final response = await dio.get(API.UP_URL);
    if (response.statusCode == 200) {
      print(response.data);
      return upcomingModelFromJson(jsonEncode(response.data));
    }
    throw Exception('Network TV Failed');
  }

  Future<ToprateModel> getTopDio() async {
    final response = await dio.get(API.TOP_URL);
    if (response.statusCode == 200) {
      print(response.data);
      return toprateModelFromJson(jsonEncode(response.data));
    }
    throw Exception('Network TV Failed');
  }

  Future<VideoModel> getClipDio(String id) async {
    final response = await dio.get(API.URLBASE + id + API.VDO_URL);
    if (response.statusCode == 200) {
      print(response.data);
      print(response.statusCode);
      return videoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network Keyword Failed');
  }
  
}