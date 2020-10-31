import 'package:dio/dio.dart';
import 'package:mpsp_virtual_assistant/model/promotoria_model.dart';
import "package:mpsp_virtual_assistant/services/api_config.dart";

class PromotoriaService {
  final ApiConfig service = new ApiConfig();

  static final String _resource = 'Promotorias';

  Future<List<PromotoriaModel>> findByAreaAtuacao(int idAreaAtuacao) async {
    List<PromotoriaModel> list = new List<PromotoriaModel>();
    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            list.add(
              PromotoriaModel.fromMap(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }

    List<PromotoriaModel> filteredList = list.where(
      (PromotoriaModel promotoria) => promotoria.areaAtuacaoID == idAreaAtuacao).toList();

    return filteredList;
  }
}
