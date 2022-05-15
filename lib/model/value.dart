import 'package:http/http.dart' as http;
import 'dart:convert';

//armazenando a URL da API.
var request =
    Uri.parse('https://api.hgbrasil.com/finance?format=json-cors&key=65bd3814');

class GetValue {
  Future<Map> getData() async {
    //Solicitando e armazenando a requisição da API.
    http.Response response = await http.get(request);
    //convertendo a resposta  da API para json e retornando o corpo da resposta.
    return jsonDecode(response.body);
  }
}
