import 'package:doaku/utils/color.dart';
import 'package:doaku/utils/lib.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget {
  final Widget title;
  const AppbarCustom({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.asset(
            'assets/images/appstore.png',
          ),
        ),
      ),
      centerTitle: true,
      title: title,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColor.kBlueDark2,
        ),
      ),
    );
  }
}
