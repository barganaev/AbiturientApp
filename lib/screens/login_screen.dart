import 'package:abiturient_app/blocs/login_bloc/login_bloc.dart';
import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/screens/news_screen.dart';
import 'package:abiturient_app/screens/requests_screen.dart';
import 'package:abiturient_app/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var fileName;

  var filePath;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController(text: "");
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

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
                return bodyWidget(context);
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

  Widget bodyWidget(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Form(
          key: _formKey,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await openFile();
                },
                child: Text("Choose file"),
              ),
              Text(filePath ?? "File path"),
              TextFormField(
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context)
                      .add(LoginDoEvent(p12: ECP_FILE, password: "Qwerty12"));
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
