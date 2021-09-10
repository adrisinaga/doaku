import 'package:doaku/core/cubit/auth/auth_bloc.dart';
import 'package:doaku/core/cubit/auth/auth_event.dart';
import 'package:doaku/core/cubit/auth/auth_state.dart';
import 'package:doaku/screens/admin/beranda/admin_beranda_screen.dart';
import 'package:doaku/screens/admin/admin_dashboard_menu.dart';
import 'package:doaku/screens/auth/login_screen.dart';
import 'package:doaku/screens/user/dashboard_menu.dart';
import 'package:doaku/utils/color.dart';
import 'package:doaku/utils/constant.dart';
import 'package:doaku/utils/lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bloc = AuthBloc();

  @override
  void initState() {
    bloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pop(context);
          state.role == 'admin'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminDashboardMenu()),
                )
              : Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardMenu()),
                );
        } else if (state is AuthUnauthenticated) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else {
          print('not defined');
        }
      },
      child: Material(
        color: AppColor.kCream,
        child: SafeArea(
          bottom: true,
          minimum: EdgeInsets.only(top: size.height * 0.12),
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipOval(
                  child: Container(
                    color: Colors.transparent,
                    height: size.height * 0.15,
                    width: size.height * 0.15,
                    child: Image.asset(AppConst.imageLogo),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.height,
                  color: AppColor.kCream,
                  child: Center(
                    child: Text(
                      "DoaKu",
                      style: TextStyle(
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kBlack),
                    ),
                  ),
                ),
                circularProgressIndicator(context),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * .05),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "© DoaKu. 2021 All Right Reserved.",
                      style: TextStyle(fontSize: 12, color: AppColor.kBlack),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
