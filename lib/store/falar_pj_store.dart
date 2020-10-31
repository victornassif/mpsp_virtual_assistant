import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';
import "package:mobx/mobx.dart";
import 'package:mpsp_virtual_assistant/config/chatbot_config.dart';
import 'package:mpsp_virtual_assistant/intents/falar_pj_intents.dart';
import 'package:mpsp_virtual_assistant/model/area_atuacao_model.dart';
import 'package:mpsp_virtual_assistant/model/contato_model.dart';
import 'package:mpsp_virtual_assistant/model/message_model.dart';
import 'package:mpsp_virtual_assistant/model/promotoria_model.dart';
import 'package:mpsp_virtual_assistant/services/area_atuacao_service.dart';
import 'package:mpsp_virtual_assistant/services/contatos_service.dart';
import 'package:mpsp_virtual_assistant/services/defaultMessages/falar_pj_default_messages.dart';
import 'package:mpsp_virtual_assistant/services/promotoria_service.dart';
part "falar_pj_store.g.dart";

class FalarPjStore = _FalarPjStore with _$FalarPjStore;

abstract class _FalarPjStore with Store {
  final PromotoriaService _promotoriaService = PromotoriaService();
  final AreaAtuacaoService _areaAtuacaoService = AreaAtuacaoService();
  final ContatosService _contatosService = ContatosService();

  _FalarPjStore() {
    init();
  }

  init() async {
    this.protocolo = this.generateProtocolNumber();
    getContatos();
    getAreasAtuacao();
    loadIntentAreaAtuacao();
  }

  String generateProtocolNumber() {
    Random random = new Random();
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    String formatted = formatter.format(now);
    int randomNumber = 1000 + random.nextInt(9999 - 1000);
    return "$formatted${randomNumber.toString()}";
  }

  loadIntentAreaAtuacao() async {
    await addMessage(
      msg: (await FalarPjDefaultMessages.getRandomMessageIntentAreaAtuacao())
          .replaceFirst('!PROTOCOLO!', this.protocolo),
      owner: 'bot',
    );
    setIntent(FalarPjIntent.AREA_ATUACAO);
  }

  loadIntentTipoContato() async {
    await addMessage(
      msg: (await FalarPjDefaultMessages.getRandomMessageIntentTipoContato()),
      owner: 'bot',
    );
    setIntent(FalarPjIntent.TIPO_CONTATO);
  }

  loadIntentInfoDesejada() async {
    await addMessage(
      msg: (await FalarPjDefaultMessages.getRandomMessageIntentInfoDesejada()),
      owner: 'bot',
    );
    setIntent(FalarPjIntent.INFO_DESEJADA);
  }

  loadIntentPesquisaSatisfacao() async {
    await addMessage(
      msg: (await FalarPjDefaultMessages
          .getRandomMessageIntentPesquisaSatisfacao()),
      owner: 'bot',
    );
    setIntent(FalarPjIntent.PESQUISA_SATISFACAO);
  }

  loadItentVoltarInicio() async {
    await addMessage(
      msg: (await FalarPjDefaultMessages.getRandomMessageIntentVoltarInicio()),
      owner: 'bot',
    );
    setIntent(FalarPjIntent.VOLTAR_INICIO);
  }

  loadIntentSairDoChat() async {
    await addMessage(
      msg: (await FalarPjDefaultMessages.getRandomMessageIntentSairDoChat()),
      owner: 'bot',
    );
    setIntent(FalarPjIntent.SAIR_DO_CHAT);
  }

  String protocolo;

  @observable
  AreaAtuacaoModel areaAtuacao;

  @observable
  ContatoModel contato;

  @observable
  bool infoDesejada;

  @observable
  bool voltarInicio;

  @observable
  int raiting;

  @observable
  ObservableList<PromotoriaModel> listaPromotoria =
      <PromotoriaModel>[].asObservable();

  @observable
  ObservableList<ContatoModel> contatos = <ContatoModel>[].asObservable();

  @observable
  ObservableList<MessageModel> messages = <MessageModel>[].asObservable();

  @observable
  ObservableList<MessageModel> loadingMessages =
      <MessageModel>[].asObservable();

  @computed
  ObservableList<MessageModel> get reversedMessages {
    ObservableList<MessageModel> all = <MessageModel>[].asObservable();
    all.addAll(this.messages);
    all.addAll(this.loadingMessages);
    return all.reversed.toList().asObservable();
  }

  @observable
  ObservableList<AreaAtuacaoModel> areasAtuacao =
      <AreaAtuacaoModel>[].asObservable();

  @observable
  FalarPjIntent intent;

  @action
  setRating(int raiting) {
    this.raiting = raiting;
  }

  @action
  setIntent(FalarPjIntent intent) {
    this.intent = intent;
  }

  @action
  setAreaAtuacao(AreaAtuacaoModel areaAtuacao) {
    this.areaAtuacao = areaAtuacao;
  }

  @action
  setContato(ContatoModel contato) {
    this.contato = contato;
  }

  @action
  setInfoDesejada(bool resp) {
    this.infoDesejada = resp;
  }

  @action
  setVoltarInicio(bool resp) {
    this.voltarInicio = resp;
  }

  @action
  setPromotorias(idAreaAtuacao) async {
    List<PromotoriaModel> promotorias =
        await this._promotoriaService.findByAreaAtuacao(idAreaAtuacao);
    this.listaPromotoria = promotorias.asObservable();
  }

  @action
  setContatos() async {
    this.contatos = await this._contatosService.findAll().asObservable();
  }

  @action
  Future<bool> addMessage({String msg, String owner, bool writing}) async {
    /**
     * Regra Padrâo:
     * Se writing não for passado, 
     * mensagens do bot exibirão writing e mensagens do usuário não exibirão writing
     */
    bool loading = writing;
    if (writing == null) {
      loading = owner == 'bot';
    }

    MessageModel message =
        new MessageModel(msg: msg, owner: owner, writing: loading);

    if (loading) {
      this.loadingMessages.add(message);
      return Future.delayed(
        const Duration(seconds: ChatbotConfig.WRITING_TIME_SECOND),
        () {
          this.loadingMessages.removeWhere(
              (loadingMessage) => loadingMessage.uuid == message.uuid);
          message.writing = false;
          this.messages.add(message);
          return true;
        },
      );
    } else {
      this.messages.add(message);
      return Future.value(true);
    }
  }

  @action
  getAreasAtuacao() async {
    List<AreaAtuacaoModel> a = await this._areaAtuacaoService.findAll();
    this.areasAtuacao = a.asObservable();
  }

  @action
  getContatos() async {
    List<ContatoModel> contatos = await this._contatosService.findAll();
    this.contatos = contatos.asObservable();
  }
}
