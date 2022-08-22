import 'package:flutter/material.dart';
import 'package:provide_exercise/ui/google_map_page.dart';
import 'package:provide_exercise/ui/home_page.dart';
import 'package:provide_exercise/ui/news_detailed_more_page.dart';
import 'package:provide_exercise/ui/news_detailed_page.dart';
import 'package:provide_exercise/ui/personal_page.dart';
import 'package:provide_exercise/ui/photos_page.dart';

class Routes {
  static const homePage = "/home";
  static const newsDetailedPage = "/home/newsDetails";
  static const newsDetailedResultPage = "/home/newsDetails/results";
  static const photosPage = "/home/photos";
  static const personalPage = "/home/personal";
  static const googleMapPage = "/home/personal/googleMapPage";
  static const notificationMapPage = "/home/notification";

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    try {
      Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};

      switch (routeSettings.name) {
        case homePage:
          return MaterialPageRoute(builder: (context) => const HomePage());
        case newsDetailedPage:
          return MaterialPageRoute(
              builder: (context) => NewsDetailedPage(args?['newsModel'] ?? ''));
        case newsDetailedResultPage:
          return MaterialPageRoute(
              builder: (context) =>
                  NewsDetailedMorePage(args?['newsModel'], args?['detailModel']));
        case photosPage:
          return MaterialPageRoute(
              builder: (context) => PhotosPage(args?['model'] ?? ''));
        case personalPage:
          return MaterialPageRoute(
              builder: (context) => PersonalPage(args?['model'] ?? ''));
        case googleMapPage:
          return MaterialPageRoute(builder: (context) => const GoogleMapPage());
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
