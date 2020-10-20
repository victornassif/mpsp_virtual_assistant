// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'falar_pj_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FalarPjStore on _FalarPjStore, Store {
  final _$listaPromotoriaAtom = Atom(name: '_FalarPjStore.listaPromotoria');

  @override
  ObservableList<PromotoriaModel> get listaPromotoria {
    _$listaPromotoriaAtom.reportRead();
    return super.listaPromotoria;
  }

  @override
  set listaPromotoria(ObservableList<PromotoriaModel> value) {
    _$listaPromotoriaAtom.reportWrite(value, super.listaPromotoria, () {
      super.listaPromotoria = value;
    });
  }

  final _$messagesAtom = Atom(name: '_FalarPjStore.messages');

  @override
  ObservableList<MessageModel> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<MessageModel> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$areasAtuacaoAtom = Atom(name: '_FalarPjStore.areasAtuacao');

  @override
  ObservableList<AreaAtuacaoModel> get areasAtuacao {
    _$areasAtuacaoAtom.reportRead();
    return super.areasAtuacao;
  }

  @override
  set areasAtuacao(ObservableList<AreaAtuacaoModel> value) {
    _$areasAtuacaoAtom.reportWrite(value, super.areasAtuacao, () {
      super.areasAtuacao = value;
    });
  }

  final _$setPromotoriasAsyncAction =
      AsyncAction('_FalarPjStore.setPromotorias');

  @override
  Future setPromotorias(dynamic idAreaAtuacao) {
    return _$setPromotoriasAsyncAction
        .run(() => super.setPromotorias(idAreaAtuacao));
  }

  final _$getAreasAtuacaoAsyncAction =
      AsyncAction('_FalarPjStore.getAreasAtuacao');

  @override
  Future getAreasAtuacao() {
    return _$getAreasAtuacaoAsyncAction.run(() => super.getAreasAtuacao());
  }

  final _$_FalarPjStoreActionController =
      ActionController(name: '_FalarPjStore');

  @override
  dynamic addMessage({String msg, String owner}) {
    final _$actionInfo = _$_FalarPjStoreActionController.startAction(
        name: '_FalarPjStore.addMessage');
    try {
      return super.addMessage(msg: msg, owner: owner);
    } finally {
      _$_FalarPjStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaPromotoria: ${listaPromotoria},
messages: ${messages},
areasAtuacao: ${areasAtuacao}
    ''';
  }
}
