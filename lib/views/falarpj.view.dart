import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mpsp_virtual_assistant/components/message-box.dart';
import 'package:mpsp_virtual_assistant/config/chatbot_config.dart';
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
                    itemBuilder: (_, index) => MessageBox(
                      index: index,
                      msg: store.reversedMessages[index].msg,
                      owner: store.reversedMessages[index].owner,
                      writing: store.reversedMessages[index].writing,
                    ),
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
                        return selectableAreaAtuacao();
                      case FalarPjIntent.TIPO_CONTATO:
                        return selectableTipoContato();
                      case FalarPjIntent.INFO_DESEJADA:
                        return selectableInformacaoDesejada();
                      case FalarPjIntent.VOLTAR_INICIO:
                        return selectableVoltarInicio();
                      default:
                        return SizedBox(height: 16);
                    }
                  },
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.112,
          ),
        ],
      ),
    );
  }

  ListView selectableAreaAtuacao() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: store.areasAtuacao.length,
      itemBuilder: (context, index) => optionButton(
        text: store.areasAtuacao[index].nome,
        onPressed: () {
          store.setAreaAtuacao(store.areasAtuacao[index]);
          store.addMessage(msg: store.areaAtuacao.nome, owner: 'user').then(
            (bool messageWrited) {
              Timer(
                Duration(seconds: ChatbotConfig.CHATBOT_READING_TIME_SECOND),
                () async {
                  await store.addMessage(
                    msg:
                        'Ok. Por favor, informe o tipo de contato que você deseja fazer',
                    owner: 'bot',
                  );
                  store.loadIntentTipoContato();
                },
              );
            },
          );
        },
      ),
    );
  }

  ListView selectableTipoContato() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: store.contatos.length,
      itemBuilder: (context, index) => optionButton(
        text: store.contatos[index].nome,
        onPressed: () async {
          String messageContatoEscolhido = store.contatos[index].nome;
          await store.addMessage(msg: messageContatoEscolhido, owner: 'user');

          String contatoInfo =
              'Informações do contato ${store.contatos[index].nome}';
          store.setContato(store.contatos[index]);

          Timer(
            Duration(seconds: ChatbotConfig.CHATBOT_READING_TIME_SECOND),
            () async {
              await store.addMessage(
                msg: contatoInfo,
                owner: 'bot',
              );
              await store.addMessage(
                msg: 'Você achou a informação desejada?',
                owner: 'bot',
              );
              store.loadIntentInfoDesejada();
            },
          );
        },
      ),
    );
  }

  ListView selectableInformacaoDesejada() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        optionButton(
          text: 'Sim',
          onPressed: () async {
            await store.addMessage(msg: 'Sim', owner: 'user');
            store.setInfoDesejada(true);
            await store.addMessage(
              msg: 'Por favor, responda uma breve pesquisa sobre o atendimento',
              owner: 'bot',
            );
            store.loadIntentPesquisaSatisfacao();
          },
        ),
        optionButton(
          text: 'Não',
          onPressed: () async {
            await store.addMessage(msg: 'Não', owner: 'user');
            store.setInfoDesejada(false);
            await store.addMessage(
              msg: 'Deseja ser atendido novamente?',
              owner: 'bot',
            );
            store.loadItentVoltarInicio();
          },
        ),
      ],
    );
  }

  ListView selectableVoltarInicio() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        optionButton(
          text: 'Sim',
          onPressed: () {
            store.addMessage(msg: 'Sim', owner: 'user');
            store.setVoltarInicio(true);
            store.init();
          },
        ),
        optionButton(
          text: 'Não',
          onPressed: () {
            store.addMessage(msg: 'Não', owner: 'user');
            store.setVoltarInicio(false);
            store.loadIntentPesquisaSatisfacao();
          },
        )
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
}
