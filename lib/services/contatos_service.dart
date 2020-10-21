import 'package:mpsp_virtual_assistant/model/contato_model.dart';

class ContatosService {

  Future<List<ContatoModel>> findAll() async {
    List<ContatoModel> contatos = new List<ContatoModel>();
    
    contatos.add(new ContatoModel(id: 1, nome: 'Telefone'));
    contatos.add(new ContatoModel(id: 2, nome: 'WhatsApp'));
    contatos.add(new ContatoModel(id: 3, nome: 'Portal'));
    contatos.add(new ContatoModel(id: 4, nome: 'Atendimento Presencial'));
    contatos.add(new ContatoModel(id: 5, nome: 'Plantão Promotorias'));

    return contatos;
  }
}
