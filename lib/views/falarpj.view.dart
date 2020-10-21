import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mpsp_virtual_assistant/intents/falar_pj_intents.dart';
import 'package:mpsp_virtual_assistant/store/falar_pj_store.dart';

class FalarPj extends StatefulWidget {
  @override
  _FalarPjState createState() => _FalarPjState();
}

class _FalarPjState extends State<FalarPj> {
  final FalarPjStore store = new FalarPjStore();

  var listScrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
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
                    itemCount: store.reversedMessages.length,
                    controller: listScrollController,
                    reverse: true,
                    itemBuilder: (_, index) =>
                        this.store.reversedMessages[index].owner == 'user'
                            ? messageUser(
                                context: context,
                                msg: store.reversedMessages[index].msg)
                            : messageBot(
                                context: context,
                                msg: store.reversedMessages[index].msg),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF022c43),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Observer(
                    builder: (context) {
                      switch (store.intent) {
                        case FalarPjIntent.AREA_ATUACAO:
                          return selectAreaAtuacao();
                        case FalarPjIntent.TIPO_CONTATO:
                          return selectTipoContato();
                        case FalarPjIntent.INFO_DESEJADA:
                          return selectInformacaoDesejada();
                        case FalarPjIntent.VOLTAR_INICIO:
                          return selectVoltarInicio();
                        default:
                          return SizedBox(height: 16);
                      }
                    },
                  )),
            ),
            height: MediaQuery.of(context).size.height * 0.112,
          )
        ],
      ),
    );
  }

  ListView selectAreaAtuacao() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: store.areasAtuacao.length,
      itemBuilder: (context, index) => optionButton(
          text: store.areasAtuacao[index].nome,
          onPressed: () {
            store.setAreaAtuacao(store.areasAtuacao[index]);
            store.addMessage(msg: store.areaAtuacao.nome, owner: 'user');
            store.loadIntentTipoContato();
          }),
    );
  }

  ListView selectTipoContato() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: store.contatos.length,
        itemBuilder: (context, index) => optionButton(
            text: store.contatos[index].nome,
            onPressed: () {
              store.addMessage(msg: store.contatos[index].nome, owner: 'user');
              store.setContato(store.contatos[index]);
              store.loadIntentInfoDesejada();
            }));
  }

  ListView selectInformacaoDesejada() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        optionButton(
            text: 'Sim',
            onPressed: () {
              store.addMessage(msg: 'Sim', owner: 'user');
              store.setInfoDesejada(true);
              store.loadIntentPesquisaSatisfacao();
            }),
        optionButton(
            text: 'Não',
            onPressed: () {
              store.addMessage(msg: 'Não', owner: 'user');
              store.setInfoDesejada(false);
              store.loadItentVoltarInicio();
            })
      ],
    );
  }

  ListView selectVoltarInicio() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        optionButton(
            text: 'Sim',
            onPressed: () {
              store.addMessage(msg: 'Sim', owner: 'user');
              store.setVoltarInicio(true);
              store.init();
            }),
        optionButton(
            text: 'Não',
            onPressed: () {
              store.addMessage(msg: 'Não', owner: 'user');
              store.setVoltarInicio(false);
              store.loadIntentPesquisaSatisfacao();
            })
      ],
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
      margin: EdgeInsets.all(5),
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
