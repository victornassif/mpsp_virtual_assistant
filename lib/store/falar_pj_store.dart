import "package:mobx/mobx.dart";
import 'package:mpsp_virtual_assistant/model/message_model.dart';
import 'package:mpsp_virtual_assistant/model/promotoria_model.dart';
import 'package:mpsp_virtual_assistant/services/promotoria_service.dart';
part "falar_pj_store.g.dart";

class FalarPjStore = _FalarPjStore with _$FalarPjStore;

abstract class _FalarPjStore with Store {

  // serviço de promotoria
  final PromotoriaService _promotoriaService = PromotoriaService();

  // lista de promotorias, de acordo com a área de atuação selecionada
  //List<PromotoriaModel> _listaPromotoria = <PromotoriaModel>[];

  @observable
  ObservableList<PromotoriaModel> listaPromotoria = <PromotoriaModel>[].asObservable();

  @observable
  ObservableList<MessageModel> messages = <MessageModel>[].asObservable();

  @action
  setPromotorias(idAreaAtuacao) async {
    this.listaPromotoria = await this._promotoriaService.findByAreaAtuacao(idAreaAtuacao).asObservable();
  }

  addMessage({String msg, String owner}) {
    MessageModel message = new MessageModel(msg: msg, owner: owner);
    this.messages.add(message);
  }
}