import "package:mobx/mobx.dart";
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

  loadIntentAreaAtuacao() {
    setIntent(FalarPjIntent.AREA_ATUACAO);
    addMessage(
        msg: 'Olá! Por favor, nos informe sua área de atuação', owner: 'bot');
  }

  loadIntentTipoContato() {
    setIntent(FalarPjIntent.TIPO_CONTATO);
    addMessage(
        msg: 'Ok. Por favor, informe o tipo de contato que você deseja fazer',
        owner: 'owner');
  }

  loadIntentInfoDesejada() {
    setIntent(FalarPjIntent.INFO_DESEJADA);
    addMessage(msg: 'Você achou a informação desejada?', owner: 'bot');
  }

  loadIntentPesquisaSatisfacao() {
    setIntent(FalarPjIntent.PESQUISA_SATISFACAO);
    addMessage(msg: 'Por favor, responda uma breve pesquisa sobre o atendimento', owner: 'bot');
  }

  loadItentVoltarInicio() {
    setIntent(FalarPjIntent.VOLTAR_INICIO);
    addMessage(msg: 'Deseja ser atendido novamente?', owner: 'bot');
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
  ObservableList<PromotoriaModel> listaPromotoria =
      <PromotoriaModel>[].asObservable();

  @observable
  ObservableList<ContatoModel> contatos = <ContatoModel>[].asObservable();

  @observable
  ObservableList<MessageModel> messages = <MessageModel>[].asObservable();

  @computed
  ObservableList<MessageModel> get reversedMessages => this.messages.reversed.toList().asObservable();

  @observable
  ObservableList<AreaAtuacaoModel> areasAtuacao =
      <AreaAtuacaoModel>[].asObservable();

  @observable
  FalarPjIntent intent;

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
    // Lógica para exibir as informações do contato selecionado
    addMessage(msg: 'Informações do contato ${contato.nome}', owner: 'bot');
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
  addMessage({String msg, String owner}) {
    MessageModel message = new MessageModel(msg: msg, owner: owner);
    this.messages.add(message);
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
