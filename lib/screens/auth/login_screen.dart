import 'package:doaku/core/cubit/auth/auth_bloc.dart';
import 'package:doaku/core/cubit/auth/auth_event.dart';
import 'package:doaku/core/cubit/auth/auth_state.dart';
import 'package:doaku/screens/admin/admin_dashboard_menu.dart';
import 'package:doaku/screens/user/dashboard_menu.dart';
import 'package:doaku/utils/color.dart';
import 'package:doaku/utils/lib.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/bezier_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final bloc = AuthBloc();

  void login(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    bloc.add(Login(
        username: emailController.text, password: passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthLoginSuccess) {

          print(state.loginModel?.data);
          if(state.loginModel?.data==[]){
            snackBarCustom(context, state.loginModel?.status ?? '');
          }
          // ignore: unrelated_type_equality_checks
          if (state.loginModel?.data?[0] == []) {
            print('user tidak ditemukan');
            snackBarCustom(context, state.loginModel?.status ?? '');
          } else {
            print('YOOWWWW');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    state.loginModel?.data?.map((e) => e.role).first == 'admin'
                        ? AdminDashboardMenu()
                        : DashboardMenu()));
          }
        } else if (state is AuthLoginFailed) {
          snackBarCustom(context, state.errorMessage ?? '');
        }
      },
      child: Container(
        color: AppColor.kCream,
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .6,
                child: BezierContainer()),
            Positioned(
                top: -height * .25,
                right: -MediaQuery.of(context).size.width * .5,
                child: BezierContainer()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(height: 50),
                    _emailPasswordWidget(),
                    SizedBox(height: 20),
                    _submitButton(context),
                    GestureDetector(
                      onTap: () {
                        print('forget password');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    // _divider(),
                    // _googleButton(),
                    SizedBox(height: height * .055),
                    _createAccountLabel(),
                  ],
                ),
              ),
            ),
            // Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    ));
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: AppColor.kWhite,
              filled: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (emailController.text.isEmpty && passwordController.text.isEmpty) {
          snackBarCustom(context, 'Harap lengkapi data');
        } else {
          login(context);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: AppColor.kBlack,
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 15, color: AppColor.kWhite),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    return GestureDetector(
      onTap: () {
        print('login with google');
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.error,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('G',
                    style: TextStyle(
                        color: AppColor.kWhite,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.error,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Login with Google',
                    style: TextStyle(
                        color: AppColor.kWhite,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                print('Register');
              },
              child: Text(
                'Register',
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'D',
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: AppColor.kBlack,
          ),
          children: [
            TextSpan(
              text: 'oaKu',
              style: TextStyle(color: AppColor.kBlack, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email", emailController),
        _entryField("Password", passwordController, isPassword: true),
      ],
    );
  }
}
