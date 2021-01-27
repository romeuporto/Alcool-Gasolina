import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class AlcoolOuGasolina extends StatefulWidget {
  @override
  _AlcoolOuGasolinaState createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    }else{
      if(precoAlcool / precoGasolina >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com álcool";
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Álcool ou Gasolina"),
          backgroundColor: Colors.blueAccent
      ),
      body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("imagens/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 80),
                  child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Álcool, ex: 1.59"
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Gasolina, ex: 1.59"
                  ),
                  style: TextStyle(
                      fontSize: 15
                  ),
                  controller: _controllerGasolina,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Calcular"),
                      onPressed: _calcular,
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
