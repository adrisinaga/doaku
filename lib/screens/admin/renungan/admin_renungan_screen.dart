import 'package:doaku/utils/lib.dart';
import 'package:flutter/material.dart';

class AdminRenunganScreen extends StatelessWidget {
  const AdminRenunganScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(text: 'Manajemen Renungan',),
      body: Container(
        child: Center(
          child: Text(
            'Renungan'
          ),
        ),
      ),
    );
  }
}