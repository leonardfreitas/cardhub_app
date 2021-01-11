import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final userTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _authContoller = Provider.of<AuthController>(context);

    return Scaffold(
      backgroundColor: Color(0xff333333),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 50.0,
        ),
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Image(
                  image: _authContoller.user.avatarUrl == null
                      ? AssetImage('assets/images/logo.png')
                      : NetworkImage(_authContoller.user.avatarUrl),
                  width: 200,
                ),
              ),
              Text(
                _authContoller.user.name != null
                    ? _authContoller.user.name
                    : 'Not Found',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TextFormField(
                controller: userTextController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Github username',
                ),
                validator: (value) {
                  if (value.isEmpty) return 'Github username is required!';
                },
              ),
              SizedBox(height: 30.0),
              Container(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _authContoller.signin(userTextController.text);
                    }
                  },
                  child: Text('Create my card'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
