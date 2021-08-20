import 'package:doaku/core/cubit/auth/auth_bloc.dart';
import 'package:doaku/core/cubit/doa_cubit.dart';
import 'package:doaku/screens/splash_screen.dart';
import 'package:doaku/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doaku/screens/dashboard_menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DoaCubit()),
        // BlocProvider(create: (_) => PostDoaCubit()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: MaterialApp(
        title: AppConst.doaku,
        theme: ThemeData(
          indicatorColor: Colors.red,
          canvasColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          accentColorBrightness: Brightness.light,
          accentColor: Colors.white,
          hintColor: Color(0xFF9E9E9E),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
