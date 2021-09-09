import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:doaku/core/cubit/doa_cubit.dart';
import 'package:doaku/core/model/doa_model.dart';
import 'package:doaku/utils/color.dart';
import 'package:doaku/utils/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBerandaScreen extends StatelessWidget {
  AdminBerandaScreen({Key? key}) : super(key: key);

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  Future<void> getDoa(BuildContext context)async{
    await context.read<DoaCubit>().getDoa();
  }

  @override
  Widget build(BuildContext context) {
    getDoa(context);
    return Scaffold(
      appBar: AppBarCustom(text: 'Admin'),
      body: ColorfulSafeArea(
        color: AppColor.kCream,
        child: Container(
          color: AppColor.kCream,
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async{
              await getDoa(context);
            },
            child: BlocBuilder<DoaCubit, DoaState>(
              builder: (context, state) {
                if (state is GetDoaLoaded) {
                  List<Datum>? listDoa = state.doaModel.data??[];
                  listDoa.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
                  return ListView.builder(
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    itemCount: listDoa.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 0, top: 10),
                      child: ItemDoa(
                        doaModel: state.doaModel,
                        index: state.doaModel.data!
                            .indexOf(state.doaModel.data![index]),
                        voidCallback: () {},
                      ),
                    ),
                  );
                } else {
                  return Center(child: circularProgressIndicator(context));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ItemDoa extends StatelessWidget {
  const ItemDoa({Key? key, this.doaModel, this.index, this.voidCallback})
      : super(key: key);
  final DoaModel? doaModel;
  final int? index;
  final VoidCallback? voidCallback;

  Future<void> deleteDoa(BuildContext context,String idDoa, String idUser)async{
    await context.read<DoaCubit>().deleteDoa(idDoa, idUser);
    await context.read<DoaCubit>().getDoa();
  }

  @override
  Widget build(BuildContext context) {
    print(doaModel?.data?[index!].userName);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.kWhite,
              border: Border.fromBorderSide(
                  BorderSide(color: Colors.white, width: 2)),
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
                    color: AppColor.kWhite,
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
                            '${doaModel?.data?[index!].userName.toString()}',
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
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:  Text('Yakin hapus doa?'),
              duration: const Duration(seconds: 5),
              action: voidCallback!=null? SnackBarAction(
                label: 'Ya',
                onPressed: ()=> deleteDoa(context,'${doaModel?.data?[index!].id?.toString()}','1' ),
              ):null,
            ));
          },
          child: CircleAvatar(
            backgroundColor: AppColor.kCream2,
              child: Icon(
            Icons.delete,
            color: AppColor.error,
          )),
        )
      ],
    );
  }
}
