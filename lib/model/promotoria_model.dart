import 'dart:convert';

class PromotoriaModel {
  int id;
  String nome;
  String rua;
  int numero;
  String cidade;
  String bairro;
  int faixaAtendimentoID;
  int areaAtuacaoID;

  PromotoriaModel(
      {this.id,
      this.nome,
      this.rua,
      this.numero,
      this.cidade,
      this.bairro,
      this.faixaAtendimentoID,
      this.areaAtuacaoID});

  factory PromotoriaModel.fromJson(String str) =>
      PromotoriaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PromotoriaModel.fromMap(Map<String, dynamic> json) => PromotoriaModel(
      id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
      nome: json["nome"],
      rua: json["rua"],
      numero: int.parse(json["numero"]),
      cidade: json["cidade"],
      bairro: json["bairro"],
      faixaAtendimentoID: int.parse(json["faixaAtendimentoID"]),
      areaAtuacaoID: int.parse(json["areaAtuacaoID"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "rua": rua,
        "numero": numero,
        "cidade": cidade,
        "bairro": bairro,
        "faixaAtendimentoID": faixaAtendimentoID,
        "areaAtuacaoID": areaAtuacaoID
      };
}
