import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var fileName;

  var filePath;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController(text: "");

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
      body: Column(
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
                  onPressed: () {},
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
