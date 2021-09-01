import 'package:doaku/core/cubit/doa_cubit.dart';
import 'package:doaku/utils/color.dart';
import 'package:doaku/utils/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPrayScreen extends StatelessWidget {
  AddPrayScreen({Key? key}) : super(key: key);
  final textCommentController = TextEditingController();

  void postDoa(BuildContext context) async {
    await context.read<DoaCubit>().postDoa(textCommentController.text, '1');
    await context.read<DoaCubit>().getDoa();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => DashboardMenu()));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBarCustom(
        text: 'Tambah Doa',
        isBack: true,
        tambahDoa: () {
          if (textCommentController.text.isNotEmpty) {
            postDoa(context);
          } else {
            snackBarCustom(context,'Harus isi doa', voidCallback: null);
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wujud Doa',
                style: styleText.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Divider(color: AppColor.kBlack, thickness: 2),
              Text(
                'Berdoa adalah wujud komunikasi batin kita terhadap Tuhan. ',
                style: styleText.copyWith(
                    fontWeight: FontWeight.normal, fontSize: 13),
              ),
              spacer10,
              TextFormField(
                onChanged: (value) {},
                controller: textCommentController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some comment';
                  }
                  return null;
                },
                minLines: 2,
                maxLines: 15,
                maxLength: 350,
                cursorColor: AppColor.kBlue,
                enableInteractiveSelection: false,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 10.0),
                  // border: InputBorder.none,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  // disabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Colors.grey,
                  //   ),
                  //   borderRadius: BorderRadius.circular(5.0),
                  // ),
                  hintText: 'Isi doa',
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: AppColor.kWhite,
                  hoverColor: AppColor.kWhite,
                  // suffixIcon: IconButton(
                  //   onPressed: () {
                  //     print(textCommentController.text.toString());
                  //   },
                  //   icon: Icon(Icons.send,color: AppColor.kBlack),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
