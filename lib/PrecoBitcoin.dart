import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PrecoBitcoin extends StatefulWidget {
  @override
  _PrecoBitcoinState createState() => _PrecoBitcoinState();
}

class _PrecoBitcoinState extends State<PrecoBitcoin> {

  String _precBit = "0";

  _consultarPreco() async {

    String url = "https://blockchain.info/ticker";
    http.Response resposta;

    resposta = await http.get(url);
    Map<String, dynamic> precoAtual = json.decode(resposta.body);

      setState(() {
        _precBit = precoAtual["BRL"]["buy"].toString();
      }
      );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/bitcoin.png"),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 32),
              child: Text(
                "R\$ ${_precBit}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),
            RaisedButton(
              onPressed: _consultarPreco,
              color: Colors.orange,
              child: Text(
                  "ATUALIZAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
