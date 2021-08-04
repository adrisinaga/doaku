import 'package:doaku/utils/lib.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  double? _height;
  double? _width;

  @override
  void initState() {
    super.initState();
    textCommentController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    textCommentController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${textCommentController.text}");
  }

  final textCommentController = TextEditingController();

  Widget containersDonate() {
    return Container(
      width: _width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: AppColor.kYellow,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Open donate: '),
              TextSpan(
                text: '\nWe welcome how much you give',
                style: styleSmallDetail,
              ),
              TextSpan(
                text: '\n\nPT. ADSI CARRYU INDONESIA\nBRI 116501000486302',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kBlack,
                ),
              ),
            ],
          ),
          style: styleDeveloper,
        ),
      ),
    );
  }

  Widget containersContribute() {
    return Container(
      width: _width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: AppColor.kYellow,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Contribute:'),
              TextSpan(
                text: '\nIf you want to contribute as a developer, email us:',
                style: styleSmallDetail,
              ),
              TextSpan(
                text: ' \n\nadmin@carryu.id',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kBlack,
                ),
              ),
            ],
          ),
          style: styleDeveloper,
        ),
      ),
    );
  }

  Widget containerComment() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Comment Section!',
                    style: styleDeveloper),
                TextSpan(
                  text:
                      '\nWe are happy if you have more ideas to us in order to add some features, list of pray of something else...',
                  style: styleSmallDetail,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            onChanged: (value) {
              print('First text : $value');
            },
            controller: textCommentController,
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some comment';
              }
              return null;
            },
            minLines: 1,
            maxLines: 10,cursorColor: AppColor.kYellow,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding: new EdgeInsets.symmetric(
                  vertical: 25.0, horizontal: 10.0),
              border: InputBorder.none,
              // border: new OutlineInputBorder(
              //   borderRadius: new BorderRadius.circular(5.0),
              //   borderSide: new BorderSide(color: Colors.white),
              // ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'Mohon tambah doa Bapa Kami',
              filled: true,
              fillColor: Colors.white,
              focusColor: AppColor.kWhite,
              hoverColor: AppColor.kWhite,
              suffixIcon: IconButton(
                onPressed: () {
                  print('button send ditekan');
                  print(textCommentController.text.toString());
                },
                icon: Icon(Icons.send,color: AppColor.kBlack),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget containers() {
    return Container(
      width: _width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          containersDonate(),
          Divider(),
          containersContribute(),
          Divider(),
          containerComment(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          containers(),


        ],
      ),
    );
  }
}
