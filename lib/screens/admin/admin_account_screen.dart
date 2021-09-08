import 'package:doaku/screens/auth/login_screen.dart';
import 'package:doaku/utils/lib.dart';
import 'package:flutter/material.dart';

class AdminAccountScreen extends StatelessWidget {
  const AdminAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          snackBarCustom(context, 'Anda ingin logout ?',
              voidCallback: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              });
        },
        child: Container(
          child: Center(child: Text('Logout'),),
        ),
      ),
    );
  }
}
