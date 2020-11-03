import 'package:mpsp_virtual_assistant/model/area_atuacao_model.dart';
import "package:mpsp_virtual_assistant/services/api_config.dart";

class AreaAtuacaoService {
  final ApiConfig service = new ApiConfig();

  // Corrigir de acordo com a API
  static final String _resource = 'AreaAtuacao';

  Future<List<AreaAtuacaoModel>> findAll() async {
    List<AreaAtuacaoModel> list = new List<AreaAtuacaoModel>();
    
    list.add(new AreaAtuacaoModel(id: 1, nome: "Cidadania"));
    list.add(new AreaAtuacaoModel(id: 2, nome: "Consumidor"));
    list.add(new AreaAtuacaoModel(id: 3, nome: "Criminal"));
    list.add(new AreaAtuacaoModel(id: 4, nome: "Direitos Humanos"));
    list.add(new AreaAtuacaoModel(id: 5, nome: "Infância e Juventude"));
    list.add(new AreaAtuacaoModel(id: 6, nome: "Urbanismo e Meio Ambiente"));

    return list;
  }
}
