import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class FalarPjDefaultMessages {
  static Future<String> getRandomMessageIntentAreaAtuacao() async {
    List<dynamic> messages = json.decode(await rootBundle
        .loadString('assets/messages/falar-pj/area-atuacao.json'));
    String message =
        FalarPjDefaultMessages._getRandomElement(messages).toString();
    return message;
  }

  static Future<String> getRandomMessageIntentTipoContato() async {
    List<dynamic> messages = json.decode(await rootBundle
        .loadString('assets/messages/falar-pj/tipo-contato.json'));
    String message =
        FalarPjDefaultMessages._getRandomElement(messages).toString();
    return message;
  }

  static Future<String> getRandomMessageIntentInfoDesejada() async {
    List<dynamic> messages = json.decode(await rootBundle
        .loadString('assets/messages/falar-pj/info-desejada.json'));
    String message =
        FalarPjDefaultMessages._getRandomElement(messages).toString();
    return message;
  }

  static Future<String> getRandomMessageIntentPesquisaSatisfacao() async {
    List<dynamic> messages = json.decode(await rootBundle
        .loadString('assets/messages/falar-pj/pesquisa-satisfacao.json'));
    String message =
        FalarPjDefaultMessages._getRandomElement(messages).toString();
    return message;
  }

  static Future<String> getRandomMessageIntentVoltarInicio() async {
    List<dynamic> messages = json.decode(await rootBundle
        .loadString('assets/messages/falar-pj/voltar-inicio.json'));
    String message =
        FalarPjDefaultMessages._getRandomElement(messages).toString();
    return message;
  }

  static Future<String> getRandomMessageIntentSairDoChat() async {
    List<dynamic> messages = json.decode(await rootBundle
        .loadString('assets/messages/falar-pj/sair-do-chat.json'));
    String message =
        FalarPjDefaultMessages._getRandomElement(messages).toString();
    return message;
  }

  static T _getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}
