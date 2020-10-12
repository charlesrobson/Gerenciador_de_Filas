import 'package:flutter/material.dart';

//Adicionando título oculto à aplicação.
void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _infoText = "Passagem Liberada!";

  void _mudarPessoa(int delta) {
    setState(() {
      _pessoa += delta;

      if (_pessoa <= 0) {
        _infoText = "Não há clientes!";
      } else if (_pessoa < 31) {
        _infoText = "Passagem Liberada!";
      } else if (_pessoa >= 31) {
        _infoText = "Acesso Negado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas:$_pessoa",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: RaisedButton(
                    child: Text(
                      "Adicionar",
                      style: TextStyle(fontSize: 20.0, color: Colors.blue),
                    ),
                    onPressed: () {
                      _mudarPessoa(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: RaisedButton(
                    child: Text(
                      "Retirar",
                      style: TextStyle(fontSize: 20.0, color: Colors.deepOrange),
                    ),
                    onPressed: () {
                      _mudarPessoa(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
