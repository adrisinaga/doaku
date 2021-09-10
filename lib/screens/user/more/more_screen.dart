import 'package:doaku/core/cubit/auth/auth_bloc.dart';
import 'package:doaku/core/cubit/auth/auth_event.dart';
import 'package:doaku/screens/auth/login_screen.dart';
import 'package:doaku/utils/lib.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
   AccountScreen({Key? key}) : super(key: key);
  final bloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBarCustom(
        text: 'More',
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
      body: Column(
        children: [
          spacer10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Salam Sejahtera',
              style: styleText.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: AppColor.kBlack, thickness: 2),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Kami adalah pelayan muda yang berfokus pada pelayanan kasih melalui teknologi agar dapat bermanfaat bagi sesama dan makin dekat kepada Tuhan. GBU.\n\nJika kalian memiliki masukkan fitur kedepannya, bisa email kami di admin@carryu.id ',
              style: styleText.copyWith(
                  fontWeight: FontWeight.normal, fontSize: 13),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Privacy Policy',
                style: styleText.copyWith(
                    fontWeight: FontWeight.normal, fontSize: 10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Copyright DoaKu v1.0.2',
                style: styleText.copyWith(
                    fontWeight: FontWeight.normal, fontSize: 10),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
