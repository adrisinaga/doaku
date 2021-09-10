import 'dart:math';

import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';

import 'custom_clipper.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          child: Transform.rotate(
            angle: -pi / 3.5,
            child: ClipPath(
              clipper: ClipPainter(),
              child: Container(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: AppColor.kBlack
                  // gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [AppColor.kCream,AppColor.kCream2]
                  // )
                ),
              ),
            ),
          )),
      Container(
          child: Transform.rotate(
        angle: -pi / 3.5,
        child: ClipPath(
          clipper: ClipPainter(),
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: AppColor.kCream2
                // gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [AppColor.kCream,AppColor.kCream2]
                // )
                ),
          ),
        ),
      )),
      Container(
          child: Transform.rotate(
        angle: -pi / 3.5,
        child: ClipPath(
          clipper: ClipPainter(),
          child: Container(
            height: MediaQuery.of(context).size.height * .44,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: AppColor.kBlack
                // gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [AppColor.kCream,AppColor.kCream2]
                // )
                ),
          ),
        ),
      )),
      Container(
          child: Transform.rotate(
            angle: -pi / 3.5,
            child: ClipPath(
              clipper: ClipPainter(),
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: AppColor.kCream2
                  // gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [AppColor.kCream,AppColor.kCream2]
                  // )
                ),
              ),
            ),
          )),
    ]);
  }
}
