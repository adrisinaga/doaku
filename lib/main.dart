import 'package:doaku/core/cubit/doa_cubit.dart';
import 'package:doaku/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:doaku/screens/dashboard_menu.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DoaCubit()),
      ],
      child: MaterialApp(
        title: AppConst.doaku,
        theme: ThemeData(
          canvasColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          accentColor: Colors.white,
          hintColor: Color(0xFF9E9E9E),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
        // theme: ThemeData(
        //   primaryColor: AppColor.kBlue,
        //   // primarySwatch: Colors.blue,
        //   buttonColor: AppColor.kYellow,
        //   // primarySwatch: ,
        //   secondaryHeaderColor: Color.fromARGB(1, 147, 98, 47),
        //   floatingActionButtonTheme: FloatingActionButtonThemeData(
        //     backgroundColor: AppColor.kYellow,
        //     elevation: 2,
        //     focusColor: Colors.white,
        //     foregroundColor: Colors.white,
        //   ),
        //   accentColor: AppColor.kBlueDark2,
        //   scaffoldBackgroundColor: AppColor.kCream,
        //   textTheme: TextTheme(
        //     headline3: TextStyle(fontSize: 26.0),
        //     headline4: TextStyle(fontSize: 24.0),
        //     headline5: TextStyle(fontSize: 18.0),
        //     headline6: TextStyle(fontSize: 16.0),
        //     bodyText1: TextStyle(fontSize: 14.0),
        //     bodyText2: TextStyle(fontSize: 12.0),
        //     caption: TextStyle(fontSize: 11.0),
        //   ),
        // ),
        home: DashboardMenu(),
      ),
    );
  }
}