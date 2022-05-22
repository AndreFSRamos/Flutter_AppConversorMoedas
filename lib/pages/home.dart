import 'package:conversor_moeda/controller/controller_campo_text.dart';
import 'package:flutter/material.dart';
import '../model/value.dart';
import '../widiget/text_convert.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Controllers de cada moedas.
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final btcController = TextEditingController();
  final GetValue valueMoeda = GetValue();
  final ControllerCampoText controllerCampoText = ControllerCampoText();
  //variaveis de cada moeda.
  late double eur;
  late double usd;
  late double btc;

  //Função para chamar o metodo da classe controller de converção do Real.
  void _realChanged(String text) {
    controllerCampoText.realChanged(realController, dolarController,
        euroController, btcController, text, usd, eur, btc);
  }

  //Função para chamar o metodo da classe controller de converção do Dolar.
  void _dolarChanged(String text) {
    controllerCampoText.dolarChanged(realController, dolarController,
        euroController, btcController, text, usd, eur, btc);
  }

  //Função para chamar o metodo da classe controller de converção do Euro.
  void _euroChanged(String text) {
    controllerCampoText.euroChanged(realController, dolarController,
        euroController, btcController, text, usd, eur, btc);
  }

  //Função para chamar o metodo da classe controller de converção do BitCoin.
  void _btcChanged(String text) {
    controllerCampoText.btcChanged(realController, dolarController,
        euroController, btcController, text, usd, eur, btc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text(
          '\$ Conversor \$',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        //Obetendo as infomarção atravez de uma requisição com a API.
        future: valueMoeda.getData(),
        builder: (context, snapshot) {
          //SWITCH para verificar o resultado da conexão com a API, caso seja
          //negativo ira informar  a messagem de erro, caso seja positivo ira
          //exibir a menssagem de carregando dados até a requizição com a API
          //ser finalizada

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  'Carregando dados...',
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Erro ao carregar dados...',
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                //Selecioando o valor de compra de cada moeda informado no Json recebido do API.
                usd = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                eur = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                btc = snapshot.data!["results"]["currencies"]["BTC"]["buy"];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Divider(),
                        SizedBox(
                          child: Image.asset('assets/icon/logo.png'),
                          height: 150,
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Valores infomados, não devem conter virgulas, letras ou caracteres especiais, apenas ( . ).',
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //Chamando o Widget Text_Convert para cada tipo de moeda e passando seus respectivos parâmetros.
                        const Divider(),
                        TextConvet(
                          nome: 'Real',
                          simbolo: 'R\$ : ',
                          acao: _realChanged,
                          controller: realController,
                        ),
                        const Divider(),
                        TextConvet(
                          nome: 'Dolar',
                          simbolo: '\$ : ',
                          acao: _dolarChanged,
                          controller: dolarController,
                        ),
                        const Divider(),
                        TextConvet(
                          nome: 'Euro',
                          simbolo: '£ : ',
                          acao: _euroChanged,
                          controller: euroController,
                        ),
                        const Divider(),
                        TextConvet(
                          nome: 'BitCoin',
                          simbolo: 'B : ',
                          acao: _btcChanged,
                          controller: btcController,
                        ),
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
