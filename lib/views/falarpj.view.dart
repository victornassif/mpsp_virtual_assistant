import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mpsp_virtual_assistant/store/falar_pj_store.dart';

class FalarPj extends StatefulWidget {
  @override
  _FalarPjState createState() => _FalarPjState();
}

class _FalarPjState extends State<FalarPj> {
  final FalarPjStore store = new FalarPjStore();

  @override
  Widget build(BuildContext context) {
    this.store.addMessage(
        msg: 'Olá! Por favor, nos informe sua área de atuação', owner: 'bot');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.77,
            child: Column(children: [
              Expanded(
                child: Observer(
                  builder: (context) => ListView.builder(
                    itemCount: this.store.messages.length,
                    itemBuilder: (_, index) =>
                        this.store.messages[index].owner == 'user'
                            ? messageUser(
                                context: context,
                                msg: this.store.messages[index].msg)
                            : messageBot(
                                context: context,
                                msg: this.store.messages[index].msg),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Observer(
                builder: (context) =>
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: store.areasAtuacao.length,
                    itemBuilder: (context, index) => optionButton(
                      text: store.areasAtuacao[index].nome, 
                      onPressed: () {}
                    ),
                  ),
                )
            ),
            height: MediaQuery.of(context).size.height * 0.112,
          )
        ],
      ),
    );
  }

  Widget optionButton({String text, Function onPressed}) {
    return Container(
      margin: EdgeInsets.only(left: 2),
          child: RaisedButton(
        child: Text(text), 
        onPressed: onPressed,
      ),
    );
  }

  Container messageBot({BuildContext context, String msg}) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Image(
            image: AssetImage('assets/small/robot.png'),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                child: Text(
                  msg,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Container messageUser({BuildContext context, String msg}) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.70,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
            child: Text(
              msg,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            )),
      ),
    );
  }
}
