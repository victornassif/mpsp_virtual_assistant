import 'package:flutter/material.dart';
import 'package:mpsp_virtual_assistant/user.dart';
import 'package:mpsp_virtual_assistant/views/falarpj.view.dart';
import 'package:toast/toast.dart';

class OptionsView extends StatefulWidget {
  @override
  _OptionsViewState createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  @override
  Widget build(BuildContext context) {
    var opcoes = [
      option(context, 'Falar com a PJ', () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FalarPj()));
      }),
    ];

    if (user.token.isNotEmpty) {
      opcoes.add(option(context, 'Consultar Andamento', () {
        Toast.show("Consultar andamento", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }));

      opcoes.add(option(context, 'Solicitar Informações', () {
        Toast.show("Solicitar informações", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }));
      opcoes.add(option(context, 'Ouvidoria', () {
        Toast.show("Ouvidoria", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }));
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.78,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                    child: Text(
                      'O que deseja fazer?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    )),
              ),
              Image(
                image: AssetImage('assets/small/robot.png'),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(21),
              border: Border.all(color: Theme.of(context).cardColor, width: 8),
            ),
            child: Column(
              children: opcoes,
            ),
          ),
        ],
      ),
    );
  }

  Padding option(BuildContext context, texto, func) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: FlatButton(
          onPressed: func,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                texto,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          )),
    );
  }
}
