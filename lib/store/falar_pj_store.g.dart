// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'falar_pj_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FalarPjStore on _FalarPjStore, Store {
  final _$areaAtuacaoAtom = Atom(name: '_FalarPjStore.areaAtuacao');

  @override
  AreaAtuacaoModel get areaAtuacao {
    _$areaAtuacaoAtom.reportRead();
    return super.areaAtuacao;
  }

  @override
  set areaAtuacao(AreaAtuacaoModel value) {
    _$areaAtuacaoAtom.reportWrite(value, super.areaAtuacao, () {
      super.areaAtuacao = value;
    });
  }

  final _$contatoAtom = Atom(name: '_FalarPjStore.contato');

  @override
  ContatoModel get contato {
    _$contatoAtom.reportRead();
    return super.contato;
  }

  @override
  set contato(ContatoModel value) {
    _$contatoAtom.reportWrite(value, super.contato, () {
      super.contato = value;
    });
  }

  final _$infoDesejadaAtom = Atom(name: '_FalarPjStore.infoDesejada');

  @override
  bool get infoDesejada {
    _$infoDesejadaAtom.reportRead();
    return super.infoDesejada;
  }

  @override
  set infoDesejada(bool value) {
    _$infoDesejadaAtom.reportWrite(value, super.infoDesejada, () {
      super.infoDesejada = value;
    });
  }

  final _$voltarInicioAtom = Atom(name: '_FalarPjStore.voltarInicio');

  @override
  bool get voltarInicio {
    _$voltarInicioAtom.reportRead();
    return super.voltarInicio;
  }

  @override
  set voltarInicio(bool value) {
    _$voltarInicioAtom.reportWrite(value, super.voltarInicio, () {
      super.voltarInicio = value;
    });
  }

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

  final _$contatosAtom = Atom(name: '_FalarPjStore.contatos');

  @override
  ObservableList<ContatoModel> get contatos {
    _$contatosAtom.reportRead();
    return super.contatos;
  }

  @override
  set contatos(ObservableList<ContatoModel> value) {
    _$contatosAtom.reportWrite(value, super.contatos, () {
      super.contatos = value;
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

  final _$intentAtom = Atom(name: '_FalarPjStore.intent');

  @override
  FalarPjIntent get intent {
    _$intentAtom.reportRead();
    return super.intent;
  }

  @override
  set intent(FalarPjIntent value) {
    _$intentAtom.reportWrite(value, super.intent, () {
      super.intent = value;
    });
  }

  final _$setPromotoriasAsyncAction =
      AsyncAction('_FalarPjStore.setPromotorias');

  @override
  Future setPromotorias(dynamic idAreaAtuacao) {
    return _$setPromotoriasAsyncAction
        .run(() => super.setPromotorias(idAreaAtuacao));
  }

  final _$setContatosAsyncAction = AsyncAction('_FalarPjStore.setContatos');

  @override
  Future setContatos() {
    return _$setContatosAsyncAction.run(() => super.setContatos());
  }

  final _$getAreasAtuacaoAsyncAction =
      AsyncAction('_FalarPjStore.getAreasAtuacao');

  @override
  Future getAreasAtuacao() {
    return _$getAreasAtuacaoAsyncAction.run(() => super.getAreasAtuacao());
  }

  final _$getContatosAsyncAction = AsyncAction('_FalarPjStore.getContatos');

  @override
  Future getContatos() {
    return _$getContatosAsyncAction.run(() => super.getContatos());
  }

  final _$_FalarPjStoreActionController =
      ActionController(name: '_FalarPjStore');

  @override
  dynamic setIntent(FalarPjIntent intent) {
    final _$actionInfo = _$_FalarPjStoreActionController.startAction(
        name: '_FalarPjStore.setIntent');
    try {
      return super.setIntent(intent);
    } finally {
      _$_FalarPjStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAreaAtuacao(AreaAtuacaoModel areaAtuacao) {
    final _$actionInfo = _$_FalarPjStoreActionController.startAction(
        name: '_FalarPjStore.setAreaAtuacao');
    try {
      return super.setAreaAtuacao(areaAtuacao);
    } finally {
      _$_FalarPjStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContato(ContatoModel contato) {
    final _$actionInfo = _$_FalarPjStoreActionController.startAction(
        name: '_FalarPjStore.setContato');
    try {
      return super.setContato(contato);
    } finally {
      _$_FalarPjStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInfoDesejada(bool resp) {
    final _$actionInfo = _$_FalarPjStoreActionController.startAction(
        name: '_FalarPjStore.setInfoDesejada');
    try {
      return super.setInfoDesejada(resp);
    } finally {
      _$_FalarPjStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVoltarInicio(bool resp) {
    final _$actionInfo = _$_FalarPjStoreActionController.startAction(
        name: '_FalarPjStore.setVoltarInicio');
    try {
      return super.setVoltarInicio(resp);
    } finally {
      _$_FalarPjStoreActionController.endAction(_$actionInfo);
    }
  }

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
areaAtuacao: ${areaAtuacao},
contato: ${contato},
infoDesejada: ${infoDesejada},
voltarInicio: ${voltarInicio},
listaPromotoria: ${listaPromotoria},
contatos: ${contatos},
messages: ${messages},
areasAtuacao: ${areasAtuacao},
intent: ${intent}
    ''';
  }
}
