import "package:mobx/mobx.dart";
import 'package:mpsp_virtual_assistant/model/area_atuacao_model.dart';
import 'package:mpsp_virtual_assistant/model/message_model.dart';
import 'package:mpsp_virtual_assistant/model/promotoria_model.dart';
import 'package:mpsp_virtual_assistant/services/area_atuacao_service.dart';
import 'package:mpsp_virtual_assistant/services/promotoria_service.dart';
part "falar_pj_store.g.dart";

class FalarPjStore = _FalarPjStore with _$FalarPjStore;

abstract class _FalarPjStore with Store {

  final PromotoriaService _promotoriaService = PromotoriaService();
  final AreaAtuacaoService _areaAtuacaoService = AreaAtuacaoService();

  _FalarPjStore() {
    init();
  }

  init() async {
    getAreasAtuacao();
  }

  @observable
  ObservableList<PromotoriaModel> listaPromotoria = <PromotoriaModel>[].asObservable();

  @observable
  ObservableList<MessageModel> messages = <MessageModel>[].asObservable();

  @observable
  ObservableList<AreaAtuacaoModel> areasAtuacao = <AreaAtuacaoModel>[].asObservable();

  @action
  setPromotorias(idAreaAtuacao) async {
    List<PromotoriaModel> promotorias = await this._promotoriaService.findByAreaAtuacao(idAreaAtuacao);
    this.listaPromotoria = promotorias.asObservable();
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
}