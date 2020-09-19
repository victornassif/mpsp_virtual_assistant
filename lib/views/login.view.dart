import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
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
                  child: InputEmail(),
                ),
                InputPassword(),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ),
                LoginButton(),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                  ),
                ),
                GoogleLoginButton(),
                SkipLoginButton()
              ],
            ),
            )
          )
        ],
      )
    );
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
          splashColor: Colors.blueAccent,
          onPressed: () {
            /*...*/
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
              style: BorderStyle.solid
            ), 
            borderRadius: BorderRadius.circular(50)
          )
        ),
      )
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: SizedBox(
        width: double.infinity, // match_parent
        child: FlatButton(
          color: Colors.white,
          textColor: Colors.black,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.white12,
          onPressed: () {
            /*...*/
          },
          child: Row(children: <Widget>[
            Image(
                image: AssetImage('assets/small/google_icon32x32.png'),
              ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
              "Login com o Google",
              style: TextStyle(fontSize: 16.0, ),
            ),
            )
          ],),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid
            ), 
            borderRadius: BorderRadius.circular(50)
          )
        ),
      )
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

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
          onPressed: () {
            /*...*/
          },
          child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
            "Entrar",
            style: TextStyle(fontSize: 16.0),
          ),
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid
            ), 
            borderRadius: BorderRadius.circular(50)
          )
        ),
      )
    );
  }
}

class InputPassword extends StatelessWidget {
  const InputPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
          labelStyle: TextStyle(
          color: Colors.white
        ),
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
        }
        return null;
      },
    );
  }
}

class InputEmail extends StatelessWidget {
  const InputEmail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    decoration: const InputDecoration(
      labelStyle: TextStyle(
        color: Colors.white
      ),
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
      }
      return null;
    },
                );
  }
}