import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Color mainClr = const Color(0xff2C274A);
Color appbarClr = const Color(0xff2C274A);
Color itemClr = const Color(0xff272344);
Color bgClr = const Color(0xff010101);
Color bgClr2 = const Color(0xff190b27);
Color checkBoxClr = const Color(0xff9587da);

TextStyle optionStyle =
    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

const String baseUrl = "https://jsonplaceholder.typicode.com/";

Widget shimmerWidget({required Widget child}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: mainClr,
    direction: ShimmerDirection.ltr,
    child: child,
  );
}
