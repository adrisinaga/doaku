import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';

const styleAppbar1 = TextStyle(
  fontSize: 20.0,
  color: AppColor.kWhite,
);
const styleAppbar2 = TextStyle(
  fontSize: 10.0,
  color: AppColor.kWhite,
);

const spacer50 = SizedBox(height: 50);
const spacer10 = SizedBox(height: 10);
const spacer5 = SizedBox(height: 5);

const styleTitle = TextStyle(fontSize: 18.0);
const styleText = TextStyle(fontSize: 20.0);
const styleDeveloper = TextStyle(fontSize: 16.0);
const styleSmallDetail = TextStyle(fontSize: 12.0, color: Colors.grey);

const boxShadow = BoxShadow(
  color: Colors.black12,
  offset: Offset(3, 3),
  blurRadius: 3,
  spreadRadius: 0,
);

extension CapExtension on String {
  String get inCaps => this.length > 0 ?'${this[0].toUpperCase()}${this.substring(1)}':'';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this.replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.inCaps).join(" ");
}

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom(
      {Key? key,
      this.text,
      this.isBack = false,
      this.description,
      this.tambahDoa})
      : super(key: key);

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String? text;
  final String? description;
  final bool? isBack;
  final VoidCallback? tambahDoa;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (isBack!)
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.asset(
                  'assets/images/appstore.png',
                ),
              ),
            ),
      centerTitle: true,
      actions: [
        (tambahDoa != null)
            ? Padding(
                padding: const EdgeInsets.only(right: 10, top: 15, bottom: 15),
                child: ElevatedButton(
                  onPressed: tambahDoa,
                  style: ElevatedButton.styleFrom(
                    // background color
                    primary: AppColor.kWhite,
                  ),
                  child: Text('Berdoa',
                      style: styleSmallDetail.copyWith(color: AppColor.kBlack)),
                ),
              )
            : Container(),
      ],
      title: (description == null)
          ? Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: text,
                    style: styleAppbar1,
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: text,
                        style: styleAppbar1,
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: (description != null) ? description : '',
                        style: styleAppbar2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColor.kBlack,
        ),
      ),
    );
  }
}

const doaAkuPercaya = Text(
    "Aku percaya akan Allah, Bapa yang Maha Kuasa, pencipta langit dan bumi. Dan akan Yesus Kristus, PuteraNya yang tunggal, Tuhan kita. Yang dikandung dari Roh Kudus, dilahirkan oleh perawan Maria. Yang menderita sengsara, dalam pemerintahan Pontius Pilatus, disalibkan, wafat dan dimakamkan. Yang turun ketempat penantian, pada hari ketiga bangkit dari antara orang mati. Yang naik ke surga, duduk disebelah kanan Allah Bapa yang Maha Kuasa. Dari situ Ia akan datang mengadili orang hidup dan mati. Aku percaya akan Roh Kudus, Gereja Katholik yang Kudus, Persekutuan para Kudus, pengampunan dosa, kebangkitan badan, kehidupan kekal. Amin");
const doaBapaKami = Text(
    "Bapa kami yang ada di surga, Dimuliakanlah nama-Mu. Datanglah kerajaan-Mu. Jadilah kehendak-Mu di atas bumi seperti di dalam surga. Berilah kami rezeki pada hari ini, dan ampunilah kesalahan kami, seperti kami pun mengampuni yang bersalah kepada kami. Dan janganlah masukkan kami ke dalam pencobaan, tetapi bebaskanlah kami dari yang jahat.");
const doaKemuliaan = Text(
  "Kemuliaan kepada ",
  style: styleText,
);

const part1 = Text(
  "Bunda Maria, Perawan yang berkuasa, bagimu tidak ada sesuatu yang mustahil, karena kekuasaan yang dianugerahkan Tuhan Yang Maha Kuasa kepadamu. Maka dengan sangat aku mohon bantuanmu dalam kesulitanku. Janganlah kiranya engkau meninggalkan daku, sebab engkau pasti dapat menolong, meski dalam perkara yang sulit, yang tak ada harapannya sekalipun, engkau tetap menjadi penolong. \n\nBaik keluhuran Tuhan, kehormatan namamu maupun keselamatan jiwaku akan bertambah jika engkau sudi mengabulkan permohonanku ini. Oleh karena itu, kalau permohonan ini benar-benar selaras dengan kehendak Tuhan yang mahakasih dan mahasuci, aku mohon dengan sangat, ya Bunda yang kuasa dalam permohonan, sudilah kiranya Bunda meneruskan permohonanku ini ke hadirat Puteramu, Yesus, yang pasti takkan menolakmu. \n\nPengharapanku yang besar ini berdasarkan kekuasaan tak terbatas, yang dianugerahkan Allah Bapa kepadamu. Dan untuk menghormati kekuasaanmu, aku berdoa bersama Santa Mechtildis yang kau beritahukan tentang latihan kebaktian “Tiga Salam Maria”, yang sangat besar manfaatnya.",
  style: styleText,
);
const part2 = Text(
  "Perawan Suci, Tahta Kebijaksanaan, berkat Sabda Allah kebijaksanaan ilahi telah tinggal di dalam dirimu. Engkau telah dianugerahi pengetahuan ilahi, tak terhingga oleh puteramu, karna sebagai makhluk paling sempurna engkau dapat menerimanya. \n\nEngkau tahu betapa besar kesulitan yang kuhadapi, betapa besar pertolongan yang kuharapkan darimu. \n\nDengan penuh kepercayaan akan tingginya kebijaksanaanmu, aku menyerahkan diri seutuhnya kepadamu, supaya engkau dapat mengatur dengan segala kesanggupan dan kedermawanan budi, demi keluhuran Tuhan dan keselamatan jiwaku. Sudilah kiranya Bunda dapat menolong dengan segala cara yang paling tepat agar tercapailah maksudku itu. \n\nBunda Maria, Bunda Kebijaksanaan Ilahi, berkenanlah mengabulkan permohonanku yang penting ini. Aku mohon ini berdasarkan kebijaksanaanmu yang tiada bandingnya, yang dikaruniakan kepadamu oleh Sabda Ilahi, putramu.\n\nBersama St. Antonius dari Padua dan St. Leonardus dari Porto Mauritio, pewarta kebaktian 'Tiga Salam Maria' yang rajin, aku berdoa untuk menghormati kebijaksanaanmu yang tiada taranya.",
  style: styleText,
);
const part3 = Text(
  "Bunda yang baik dan lembut hati, Bunda Kerahiman Sejati yang akhir-akhir ini disebut “Bunda yang penuh belas kasih”, aku datang padamu, dan mohon dengan sangat, sudilah kiranya Bunda memperlihatkan belas kasihmu kepadaku.\n\nAku tahu, bahwa aku tak pantas mendapat karunia itu. Sebab kerapkali aku menyedihkan hatimu dengan menghina Yesus, Puteramu . Betapapun besar kesalahanku, aku sangat menyesal karena telah melukai Hati Kudus Yesus dan hati kudusmu. \n\nEngkau memperkenalkan diri sebagai “Bunda para pendosa yang bertobat” kepada St. Brigita. Maka, ampunilah kiranya segala tidak tahu terima kasihku yang sudah-sudah. Ingatlah saja akan keluhuran Tuhan serta kerahiman dan kebaikan hatimu yang akan terpancar, dengan mengabulkan anugerah permohonan ini dengan perantaraanmu. \n\nBunda, Perawan yang penuh kebaikan ,lembut hati dan manis, belum pernah engkau membiarkan yang datang mohon pertolongamu. \n\nAtas kerahiman dan kebaikanmu dan lewat doamu aku mengharap dengan sangat anugerah Roh Kudus. Dan demi keluhuran namamu, bersama St. Alfonsus Maria de Ligouri, rasul kerahimanmu serta guru kebaktian “Tiga Salam Maria” ini, aku berdoa untuk menghormati kerahimanmu dan kebaikanmu.",
  style: styleText,
);
const bundaMariaBaikHatiJauhkanDariDosaBerat = Text(
  "Bunda Maria yang baik hati, jauhkanlah...... (aku),(dia),(kami) dari Dosa Berat.",
  style: styleText,
);
const salamMaria3x = Text(
  "Salam Maria... 3x",
  style: styleText,
);
const ujudDoaKita = Text(
  "{Ujud Doa Kita}",
  style: styleText,
);
const bundaMaria = Text(
  "Bunda Maria, Bunda yang baik hati, bantulah aku dalam menempuh kehidupanku ini, agar aku dapat mencapai kebahagiaanku dan cita-citaku. \n\nOh Bunda bila aku ingat akan masa depanku dan kesulitan-kesulitanku, aku merasa sangat khawatir dan sedih, seringkali merasa berputus asa. \n\nKarenanya Bunda, tolonglah aku dalam kesulitan-kesulitanku ini, bantulah agar aku selamat, sampai pada cita-citaku. \n\nOh Roh Kudus terangilah akal budiku dan bimbinglah aku, ampunilah kesalahanku dan kabulkanlah doaku \n\nAmin.",
  style: styleText,
);
const jiwaMaria = Text(
  "Jiwa Maria, sucikanlah aku\nHati Maria, nyalakanlah aku\nTangan Maria, sanggahlah aku\nKaki Maria, pimpinlah aku\nMata Maria, pandanglah aku\nBibir Maria, berkatalah padaku\nDukacita Maria, kuatkanlah aku\nO Maria yang manis, dengarkanlah aku\nJanganlah mengijinkan daku terpisah darimu\n\nTerhadap musuh-musuhku, belalah aku\nTuntunlah aku kepada Yesus yang manis\nSemoga dengan Dikau, aku dapat mencintai dan \nmemuji Dikau untuk selama-lamanya. \n\nAmin.",
  style: styleText,
);
const permohonanKpdAllah = Text(
    "Tuhanku, tiap tiap hari aku menghadapMu, Nasihatilah aku\n\nMasa mudaku dan tak lihat jalan, Nasihatilah daku\n\nPimpinlah tempat yang kuharus jalani\n\nSupaya kehidupanku menunjukkan cinta kasih kepada-Mu\n\nSinari kegelapan dengan pernyataan kehendak-Mu, Terangilah aku.\n\nOleh firman-Mu, Tenangkanlah ketakutanku, Terangilah aku.\n\nJalanku kurang terpandang, Tak dapat kulihat ujung jalan yang menuju pada-Mu\n\nBerilah aku ketegasan untuk mengikuti cahaya-Mu, Teguhkanlah aku.\n\nBerikanlah aku kekuatan untuk memilih yang benar, Teguhkanlah aku.\n\nBegitu tidak lagi bertanggung jawab hatiku. \n\nYa, nyalakanlah dalam hatiku api cinta kasih-Mu.\n\n\nAmin.",
    style: styleText);

const tipsKoronka =
    Text('Doa Koronka didoakan menggunakan 50 manik-manik Rosario biasa..');

const doaPembukaKoronka = Text(
  'Ya Yesus, Engkau sudah wafat, tetapi mata air kehidupan memancar bagi jiwa-jiwa dan lautan kerahiman terbuka untuk seluruh dunia. O Mata Air Kehidupan, Kerahiman Ilahi yang tak terhingga, rengkuhlah seluruh dunia dan hampakan diri-Mu untuk kami. \n\nDarah dan air yang memancar dari Hati Yesus sebagai mat air kerahiman bagi kami, aku mengandalkan Engkau! (3x)',
  style: styleText,
);

const tipsDoaKoronka1 =
    Text('Pada manik "Bapa Kami" rosario biasa, diucapkan doa berikut ini: \n');

const isiDoaKoronka1 = Text(
  'Bapa yang Kekal, kupersembahkan kepada-Mu\nTubuh dan Darah, Jiwa dan Ke-Allahan Putra-Mu yang terkasih, Tuhan Kami Yesus Kristus, sebagai pendamaian untuk dosa kami dan dosa seluruh dunia',
  style: styleText,
);

const tipsDoaKoronka2 = Text(
    'Pada manik "Salam Maria" rosario biasa, diucapkan doa berikut ini:\n');

const isiDoaKoronka2 = Text(
  'Demi sengsara Yesus yang pedih, tunjukkanlah \nbelas kasihMu kepada kami dan seluruh dunia (10x)',
  style: styleText,
);

const tipsDoaKoronka3 = Text('Koronka ditutup dengan doa: \n');

const isiDoaKoronka3 = Text(
  'Allah yang Kudus, Kudus dan berkuasa, Kudus dan Kekal, kasihinilah kami dan seluruh dunia (3x)',
  style: styleText,
);

const doaPenutup1 = Text(
  'Doa Penutup\n',
  style: styleTitle,
);

const doaPenutup2 = Text(
  'Allah yang kekal, dalam diri-Mu ada kerahiman yang tanpa batas dan harta belas kasihan yang tak kunjung habis, padanglah kami dengan rela hati dan tingkatkanlah Kerahiman-Mu dalam diri kami, supaya pada saat-saat sulit kami tidak menjadi putus asa atau remuk hati, tetapi dengan kepercayaan yang teguh menyerahkan diri kami kepada kehendak-Mu yang kudus, Sang Kasih dan Sang Kerahiman sendiri.\n\nAmin.',
  style: styleText,
);

const doaPenyembuhan1 = Text(
  'Doa Penyembuhan\n',
  style: styleTitle,
);

const doaPenyembuhan2 = Text(
  'Yesus, semoga darah-Mu yang murni dan sehat mengalir di dalam organ-organ tubuhku yang sakit; semoga tubuhMu yang murni dan sehat mengubah tubuhku yang lemah ini; dan semoga kehidupan-Mu yang sehat dan perkasa mengalir dalam diriku, bila itu benar-benar kehendak kudus-Mu bagiku.\n\nAmin.',
  style: styleText,
);
