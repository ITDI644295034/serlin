import 'package:flutter/material.dart';
import 'package:flutter_application_3/page/detail_pop.dart';
import 'package:flutter_application_3/page/detail_top.dart';
import 'package:flutter_application_3/page/detail_up.dart';
import 'package:flutter_application_3/page/home.dart';
import 'package:flutter_application_3/page/vdo_pop.dart';

class AppRoute {
  static const homeRoute = 'home';
  static const detailRoute = 'detail';
  static const detailUpRoute = 'detailUp';
  static const detailTopRoute = 'detailTop';
  static const clipPopRoute = 'clipPop';
  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    detailRoute: (context) => DetailPage(),
    detailUpRoute: (context) => DetailUpcoming(),
    detailTopRoute: (context) => DetailToprate(),
    clipPopRoute:(context) => VdoPopPage()
  };

  get routeAll => _route;
}
