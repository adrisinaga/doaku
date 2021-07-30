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
    // TODO: implement initState
    super.initState();
    textCommentController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    textCommentController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${textCommentController.text}");
  }

  final textCommentController = TextEditingController();

  Widget containersDeveloper() {
    return Expanded(
      child: Container(
        width: _width,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
//          boxShadow: [
//            BoxShadow(
//              color: Colors.brown.withOpacity(0.1),
//              spreadRadius: 2,
//              blurRadius: 1,
//              offset: Offset(0, 3), // changes position of shadow
//            ),
//          ],
          gradient: LinearGradient(
            colors: [
              AppColor.kWhite,
              AppColor.kYellow,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Developer: ',
                ),
                TextSpan(
                  text: '\nWe develop this app with passion',
                  style: styleSmallDetail,
                ),
                TextSpan(
                  text: '\n\nTeam Carryu Indonesia',
                  style: TextStyle(
                    letterSpacing: 0.4,
                    fontWeight: FontWeight.w900,
                    color: AppColor.kWhite,
                  ),
                ),
              ],
            ),
            style: styleDeveloper,
          ),
        ),
      ),
    );
  }

  Widget containersDonate() {
    return Expanded(
      child: Container(
        width: _width,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
//          boxShadow: [
//            BoxShadow(
//              color: Colors.brown.withOpacity(0.1),
//              spreadRadius: 2,
//              blurRadius: 1,
//              offset: Offset(0, 3), // changes position of shadow
//            ),
//          ],
          gradient: LinearGradient(
            colors: [
              AppColor.kWhite,
              AppColor.kYellow,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                    color: AppColor.kWhite,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            style: styleDeveloper,
          ),
        ),
      ),
    );
  }

  Widget containersContribute() {
    return Expanded(
      child: Container(
        width: _width,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
//          boxShadow: [
//            BoxShadow(
//              color: Colors.brown.withOpacity(0.1),
//              spreadRadius: 2,
//              blurRadius: 1,
//              offset: Offset(0, 3), // changes position of shadow
//            ),
//          ],
          gradient: LinearGradient(
            colors: [
              AppColor.kWhite,
              AppColor.kYellow,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                    color: AppColor.kWhite,
                  ),
                ),
              ],
            ),
            style: styleDeveloper,
          ),
        ),
      ),
    );
  }

  Widget containerComment() {
    return Container(
      height: _height! * 0.5,
//            color: kTesterContainer,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: _width,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppColor.kWhite,
                      AppColor.kYellow,
                    ],
                  ),
//                  boxShadow: [
//                    BoxShadow(
////                      color: Colors.indigo.withOpacity(0.2),
//                      spreadRadius: 2,
//                      blurRadius: 1,
//                      offset: Offset(0, 3), // changes position of shadow
//                    ),
//                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Comment Section!',
                                style: styleDeveloper),
                            TextSpan(
                              text:
                                  '\n\nWe are happy if you have more ideas to us in order to add some features, list of pray of something else...',
                              style: styleSmallDetail,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
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
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 10.0),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(color: Colors.white),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Ex: Tolong tambah Doa Bopa Kami',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {
                              print('button send ditekan');
                              print(textCommentController.text.toString());
                            },
                            icon: Icon(Icons.send),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget containers() {
    return Container(
      height: _height! * 0.5,
      width: _width,
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          containersDeveloper(),
          containersDonate(),
          containersContribute(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scrollbar(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            containers(),
            containerComment(),
          ],
        ),
      ),
    );
  }
}
