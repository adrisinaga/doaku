import 'package:doaku/core/cubit/auth/auth_bloc.dart';
import 'package:doaku/core/cubit/auth/auth_event.dart';
import 'package:doaku/screens/auth/login_screen.dart';
import 'package:doaku/utils/color.dart';
import 'package:doaku/utils/lib.dart';
import 'package:flutter/material.dart';

class AdminMoreScreen extends StatelessWidget {
   AdminMoreScreen({Key? key}) : super(key: key);

  final bloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        text: 'Pengaturan',
        action: Padding(
          padding: const EdgeInsets.only(right: 10, top: 15, bottom: 15),
          child: ElevatedButton(
            onPressed: () {
              snackBarCustom(context, 'Anda ingin logout ?', voidCallback: () {
                bloc.add(Logout());
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              });
            },
            style: ElevatedButton.styleFrom(
              // background color
              primary: AppColor.error,
            ),
            child: Text('Logout',
                style: styleSmallDetail.copyWith(color: AppColor.kWhite)),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rule'),
            ],
          ),
        ),
      ),
    );
  }
}
