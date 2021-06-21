import 'dart:convert';

import 'package:abiturient_app/blocs/login_bloc/login_bloc.dart';
import 'package:abiturient_app/screens/requests_screen.dart';
import 'package:abiturient_app/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' as Io;

class Login2Screen extends StatefulWidget {
  @override
  _Login2ScreenState createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  bool _rememberMe = false;
  var fileName;
  String img64;

  TextEditingController _passwordController = TextEditingController(text: "");

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  var filePath;
  Future<void> openFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        fileName = file.name;
        filePath = file.path;
      });
    } else {
      print('ERROR IS IN OPENFILE FUNCTION!');
    }
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Файл',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        InkWell(
          onTap: () async {
            await openFile();
            final bytes = Io.File('${filePath}').readAsBytesSync();
            img64 = base64Encode(bytes);
          },
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              enabled: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.file_copy,
                  color: Colors.white,
                ),
                hintText: filePath ?? 'Выберите файл',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Пароль',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _passwordController,
            // onEditingComplete: () {
            //   BlocProvider.of<LoginBloc>(_scaffoldkey.currentState.context)
            //       .add(LoginDoEvent(p12: ECP_FILE, password: "Qwerty12"));
            // },
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Введите пароль',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          BlocProvider.of<LoginBloc>(context)
              .add(LoginDoEvent(p12: ECP_FILE, password: "Qwerty12"));

          /// this.img  // pass controller text
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Войти',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: Builder(
          builder: (context) => BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadedState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contex) => RequestsScreen() /*MyHomeScreen()*/,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is LoginLoadedState || state is LoginInitialState) {
                return AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF73AEF5),
                                Color(0xFF61A4F1),
                                Color(0xFF478DE0),
                                Color(0xFF398AE5),
                              ],
                              stops: [0.1, 0.4, 0.7, 0.9],
                            ),
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 120.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Вход',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                _buildEmailTF(),
                                SizedBox(
                                  height: 30.0,
                                ),
                                _buildPasswordTF(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                // _buildForgotPasswordBtn(),
                                // _buildRememberMeCheckbox(),
                                _buildLoginBtn(context),
                                // _buildSignInWithText(),
                                // _buildSignupBtn(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else if (state is LoginLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text("Error"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
