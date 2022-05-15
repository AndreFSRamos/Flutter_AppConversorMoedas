import 'package:flutter/cupertino.dart';

/*  1) Os atributos (toStringAsFixed()) ultilizados nas funçãoes change
servem para controlar as casas decimais de cada compo, bas informar um numero 
inteiro. 

2) as função de change recebem como parâmetro, as controllers de cada moeda e o
 texto digitado no campo*/
class ControllerCampoText {
  void clearAll(TextEditingController real, TextEditingController dolar,
      TextEditingController euro, TextEditingController bitCoin) {
    real.clear();
    dolar.clear();
    euro.clear();
    bitCoin.clear();
  }

  //Funcão pra converter Real para doloar, Euro e BitCoin.
  void realChanged(
    TextEditingController real,
    TextEditingController dolar,
    TextEditingController euro,
    TextEditingController bitCoin,
    String text,
    double usd,
    double eur,
    double btc,
  ) {
    //verifica SE o campo é vazio, SE sim chama a função pra limpar todos os demais campos.
    if (text.isEmpty) {
      clearAll(real, dolar, euro, bitCoin);
      return;
    }
    try {
      //Recebe a informação do campo e converte para o tipo Double.
      double real = double.parse(text);
      //convertendo Real para Dolar.
      dolar.text = (real / usd).toStringAsFixed(2);
      //Convertendo Real para Euro.
      euro.text = (real / eur).toStringAsFixed(2);
      //Convetendo Real para BitCoin.
      bitCoin.text = (real / btc).toStringAsFixed(4);
    } catch (e) {
      e;
    }
  }

  //Função para converter Dolar em Real, Euro e BitCoin
  void dolarChanged(
    TextEditingController real,
    TextEditingController dolar,
    TextEditingController euro,
    TextEditingController bitCoin,
    String text,
    double usd,
    double eur,
    double btc,
  ) {
    if (text.isEmpty) {
      clearAll(real, dolar, euro, bitCoin);
      return;
    }
    try {
      double dolar = double.parse(text);
      //Convertendo Dolar para Real.
      real.text = (dolar * usd).toStringAsFixed(2);
      //Convetendo Dolar para Euro.
      euro.text = ((dolar * usd) / eur).toStringAsFixed(2);
      //Convetendo Dolar para BitCoin.
      bitCoin.text = ((dolar * usd) / btc).toStringAsFixed(4);
    } catch (e) {
      e;
    }
  }

  //Funcão para converter Euro em Dolar, Real e BitCoin.
  void euroChanged(
    TextEditingController real,
    TextEditingController dolar,
    TextEditingController euro,
    TextEditingController bitCoin,
    String text,
    double usd,
    double eur,
    double btc,
  ) {
    if (text.isEmpty) {
      clearAll(real, dolar, euro, bitCoin);
      return;
    }
    try {
      double euro = double.parse(text);
      //Convetendo Euro para Real.
      real.text = (euro * eur).toStringAsFixed(2);
      //Convertendo Euro para Dolar.
      dolar.text = ((euro * eur) / usd).toStringAsFixed(2);
      //Convetendo Euro para BitCoin.
      bitCoin.text = ((euro * eur) / btc).toStringAsFixed(4);
    } catch (e) {
      e;
    }
  }

  //Função para converter BitCoin em Dolar, Euro e real.
  void btcChanged(
    TextEditingController real,
    TextEditingController dolar,
    TextEditingController euro,
    TextEditingController bitCoin,
    String text,
    double usd,
    double eur,
    double btc,
  ) {
    if (text.isEmpty) {
      clearAll(real, dolar, euro, bitCoin);
      return;
    }
    try {
      double bitcion = double.parse(text);
      //Convetendo BitCoin para Real.
      real.text = (bitcion * btc).toStringAsFixed(2);
      //Convertendo BitCoin para Dolar.
      dolar.text = ((bitcion * btc) / usd).toStringAsFixed(2);
      //Convertendo BitCoin para Euro.
      euro.text = ((bitcion * btc) / eur).toStringAsFixed(2);
    } catch (e) {
      e;
    }
  }
}
