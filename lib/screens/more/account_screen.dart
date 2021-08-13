import 'package:doaku/utils/lib.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kCream,
      appBar: AppBarCustom(text: 'Akun'),
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          children: [
            spacer10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Wujud Doa',
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
            spacer50,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Donasi Kasih',
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
                'Untuk melanjutkan beberapa fitur yang masih kurang, kami butuh dukungan kalian dalam bentuk doa dan materi. Bagi kalian yang ingin mendukung kami, silakan donasikan ke rekening di Bank BCA a.n. Diana 321328928.\n\nDonasi ini akan kami gunakan untuk pembayaran operasional, pihak ketiga, dan kebutuhan yang berkaitan dengan pengembangan aplikasi DoaKu. Terimakasih.',
                style: styleText.copyWith(
                    fontWeight: FontWeight.normal, fontSize: 13),
              ),
            ),
            spacer50,
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
            )
          ],
        ),
      ),
    );
  }
}
