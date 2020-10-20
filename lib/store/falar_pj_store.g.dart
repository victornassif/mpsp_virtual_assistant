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

  @override
  String toString() {
    return '''
listaPromotoria: ${listaPromotoria}
    ''';
  }
}
