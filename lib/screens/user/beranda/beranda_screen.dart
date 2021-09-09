import 'dart:ui';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:doaku/core/cubit/doa_cubit.dart';
import 'package:doaku/core/model/doa_model.dart';
import 'package:doaku/utils/lib.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_pray_screen.dart';

class BerandaScreen extends StatefulWidget {
  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> loadData(BuildContext context) async {
    await context.read<DoaCubit>().getDoa();
  }

  Future<void> postBerdoa(BuildContext context,String idDoa, String idUser)async{
     await context.read<DoaCubit>().postBerdoa(idDoa, idUser);
  }

  final bloc = DoaCubit();

  @override
  void initState() {
    loadData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.kCream2,
      appBar: AppBarCustom(
          text: 'DoaKu', description: 'Doa adalah nafas hidup', isBack: false),
      body: ColorfulSafeArea(
        color: AppColor.kBlue,
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async{
            await loadData(context);
          },
          child: BlocBuilder<DoaCubit, DoaState>(
            builder: (context, state) {
              if (state is GetDoaLoaded) {
                // print(state.doaModel.data!.sort((a,b)=>a.updatedAt!.compareTo(b.updatedAt!)));
                // print(state.doaModel.data!.sort());
                List<Datum>? listDoa = state.doaModel.data??[];
                listDoa.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
                return (state.doaModel.data != null)
                    ? ListView.builder(
                        addAutomaticKeepAlives: false,
                        addRepaintBoundaries: false,
                        itemCount: listDoa.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 0, top: 10),
                          child: ItemDoa(
                            doaModel: state.doaModel,
                            index: state.doaModel.data!.indexOf(state.doaModel.data![index]),
                            voidCallback: () {
                              var idDoa = state.doaModel.data![index].id!.toString();
                              var idUser = state.doaModel.data![index].idUser!.toString();
                              postBerdoa(context,idDoa,idUser);
                            },
                          ),
                        ),
                      )
                    : Container();
              }
              else if(state is DoaUninitialized){
                return Center(
                    child: circularProgressIndicator(context));
              }
              else{
                return Container();
              }
            },
          ),
        ),
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
  const ItemDoa({Key? key, this.doaModel, this.index,this.voidCallback}) : super(key: key);
  final DoaModel? doaModel;
  final int? index;
  final VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 2)),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5),
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          // index!=0?Divider(thickness: 2):Container(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              // color: AppColor.kCream2,
              color: AppColor.kWhite,
              // boxShadow: [
              //   boxShadow,
              // ],

              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      doaModel!.data![index!].isiDoa!.toString().inCaps,
                      style: styleDeveloper.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // spacer5,
                    Text(
                      'Maria Lestari',
                      style: styleSmallDetail.copyWith(fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${doaModel?.data?[index!].createdAt?.toLocal().toString()}',
                        style: styleSmallDetail.copyWith(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: AppColor.kCream2,
                  color: AppColor.kWhite,
                  // boxShadow: [boxShadow],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: AppColor.kBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    onTap: voidCallback,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/icon_pray.png"),
                            size: 15,
                            color: AppColor.kBlueLight,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Doakan Sekarang',
                            style: styleSmallDetail.copyWith(
                              fontSize: 12,
                              color: AppColor.kBlueLight,
                            ),
                          ),
                          Text(' - ',style: TextStyle(color: AppColor.kGrey),),
                          Text(
                            '${doaModel!.data![index!].totalPrayed??'0'} orang berdoa',
                            style: styleSmallDetail.copyWith(
                              fontSize: 9,
                              color: AppColor.kGrey,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

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
      ),
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
