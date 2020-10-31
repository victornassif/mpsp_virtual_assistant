import 'package:flutter/material.dart';
import 'package:mpsp_virtual_assistant/controllers/LoginController.dart';
import 'package:mpsp_virtual_assistant/views/assistant.view.dart';
import 'package:toast/toast.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final controller = new LoginController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  var busy = false;

  String username = "";
  String password = "";

  handleSignIn() {
    if (_formKey.currentState.validate()) {
      setState(() {
        busy = true;
      });
      controller.login(username, password).then((data) {
        onSuccess();
      }).catchError((err) {
        onError();
      }).whenComplete(() {
        onComplete();
      });
    }
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InitialAssistant(),
      ),
    );
  }

  onError() {
    Toast.show("Falha no login. Por favor, verifique o usuário e a senha.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  }

  onComplete() {
    setState(() {
      busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 60, right: 60, top: 50),
              child: Image(
                image: AssetImage('assets/original/mpsp-logo.png'),
              ),
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: InputEmail(
                          setEmail: (value) {
                            setState(() {
                              username = value.toString();
                            });
                          }
                        ),
                      ),
                      InputPassword(
                        setPassword: (value) {
                          setState(() {
                            password = value.toString();
                          });
                        }
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      LoginButton(
                        callback: (){
                          handleSignIn();
                        }
                      ),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                        ),
                      ),
                      SkipLoginButton()
                    ],
                  ),
                ))
          ],
        ));
  }
}

class SkipLoginButton extends StatelessWidget {
  const SkipLoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity, // match_parent
          child: FlatButton(
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Theme.of(context).accentColor,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                "Pular",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    this.callback
  }) : super(key: key);
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity, // match_parent
          child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: callback,
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.blue, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50))),
        ));
  }
}

class InputPassword extends StatelessWidget {

  final setPassword;

  const InputPassword({
    Key key,
    this.setPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        border: OutlineInputBorder(),
        labelText: 'Digite sua senha',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor, digite sua senha';
        } else {
          this.setPassword(value.toString());
        }
        return null;
      },
    );
  }
}

class InputEmail extends StatelessWidget {

  final setEmail;

  const InputEmail({
    Key key,
    this.setEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        border: OutlineInputBorder(),
        labelText: 'Digite seu e-mail',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor, digite seu e-mail';
        } else {
          this.setEmail(value.toString());
        }
        return null;
      },
    );
  }
}
