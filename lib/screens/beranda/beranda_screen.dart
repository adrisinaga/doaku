import 'dart:ui';

import 'package:doaku/core/cubit/doa_cubit.dart';
import 'package:doaku/core/model/doa_model.dart';
import 'package:doaku/screens/beranda/add_pray_screen.dart';
import 'package:doaku/utils/lib.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BerandaScreen extends StatelessWidget {
  void loadData(BuildContext context) async {
    await context.read<DoaCubit>().getDoa();
  }

  @override
  Widget build(BuildContext context) {
    loadData(context);
    return Scaffold(
      backgroundColor: AppColor.kCream,
      appBar: AppBarCustom(
          text: 'DoaKu', description: 'Doa adalah nafas hidup', isBack: false),
      body: BlocBuilder<DoaCubit, DoaState>(
        builder: (context, state) {
          if (state is GetDoaLoaded) {
            // print(state.doaModel.data!.sort((a,b)=>a.updatedAt!.compareTo(b.updatedAt!)));
            // print(state.doaModel.data!.sort());
            List<Datum>? listDoa = state.doaModel.data!;
            listDoa.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
            return (state.doaModel.data != null)
                ? ListView.builder(
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    itemCount: listDoa.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      child: ItemDoa(
                        isiDoa: listDoa[index].isiDoa!,
                      ),
                    ),
                  )
                : Container();
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: AppColor.kBlack,
            ));
          }
        },
      ),
      floatingActionButton: Container(
        height: 50.0,
        width: 50.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: AppColor.kBlack,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddPrayScreen())),
            child: Icon(
              Icons.add,
              size: 35,
              color: AppColor.kWhite,
            ),
          ),
        ),
      ),
    );
  }
}

class ItemDoa extends StatelessWidget {
  const ItemDoa({Key? key, this.isiDoa}) : super(key: key);
  final String? isiDoa;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            // color: AppColor.kCream2,
            color: AppColor.kWhite,
            boxShadow: [
              boxShadow,
            ],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Maria Lestari',
                    //   style: styleSmallDetail.copyWith(
                    //       fontSize: 13,
                    //       fontWeight: FontWeight.bold,
                    //       color: AppColor.kBlack),
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    spacer10,
                    Text(
                      isiDoa!.inCaps,
                      style: styleDeveloper.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    spacer5,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '04 Feb 2021 . 17:22',
                        style: styleSmallDetail,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // spacer10,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                // color: AppColor.kCream2,
                color: AppColor.kWhite,
                boxShadow: [boxShadow],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Material(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.transparent,
                child: InkWell(
                  splashColor: AppColor.kBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/icon_pray.png"),
                          size: 20,
                          color: AppColor.kBlueLight,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doakan Sekarang',
                              style: styleSmallDetail.copyWith(
                                fontSize: 12,
                                color: AppColor.kBlueLight,
                              ),
                            ),
                            Text(
                              '43 orang berdoa',
                              style: styleSmallDetail.copyWith(
                                fontSize: 9,
                                color: AppColor.kBlack,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ItemMenu extends StatelessWidget {
  final String? namaDoa;
  final Widget? screen;

  const ItemMenu({Key? key, this.namaDoa, this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 10,
        child: Container(
          height: size.height / 20,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.kWhite,
                AppColor.kYellow,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
//                Navigator.push(
//                    contexts, MaterialPageRoute(builder: (contexts) => screen));

                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return screen!;
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation.drive(
                        Tween(begin: 0.7, end: 1.0).chain(
                          CurveTween(
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                      ),
                      child: child,
                    ),
                  );
                }));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    namaDoa!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
