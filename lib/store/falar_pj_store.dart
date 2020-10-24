import 'dart:async';
import "package:mobx/mobx.dart";
import 'package:mpsp_virtual_assistant/config/chatbot_config.dart';
import 'package:mpsp_virtual_assistant/intents/falar_pj_intents.dart';
import 'package:mpsp_virtual_assistant/model/area_atuacao_model.dart';
import 'package:mpsp_virtual_assistant/model/contato_model.dart';
import 'package:mpsp_virtual_assistant/model/message_model.dart';
import 'package:mpsp_virtual_assistant/model/promotoria_model.dart';
import 'package:mpsp_virtual_assistant/services/area_atuacao_service.dart';
import 'package:mpsp_virtual_assistant/services/contatos_service.dart';
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
    getContatos();
    getAreasAtuacao();
    loadIntentAreaAtuacao();
  }

  loadIntentAreaAtuacao() async {
    await addMessage(
      msg: 'Olá! Por favor, nos informe sua área de atuação', 
      owner: 'bot',
    );
    setIntent(FalarPjIntent.AREA_ATUACAO);
  }

  loadIntentTipoContato() {
    setIntent(FalarPjIntent.TIPO_CONTATO);
  }

  loadIntentInfoDesejada() {
    setIntent(FalarPjIntent.INFO_DESEJADA);
  }

  loadIntentPesquisaSatisfacao() async {
    await addMessage(
      msg: 'O que você achou do nosso atendimento?',
      owner: 'bot',
    );
    setIntent(FalarPjIntent.PESQUISA_SATISFACAO);
  }

  loadItentVoltarInicio() {
    setIntent(FalarPjIntent.VOLTAR_INICIO);
  }

  loadIntentSairDoChat() {
    setIntent(FalarPjIntent.SAIR_DO_CHAT);
  }

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
