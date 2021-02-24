import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Text(
                  '¡Hola! Para seguir, ingresá tu e-mail o usuario',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical:60.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'E-mail o usuario'
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Continuar')
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/checkRegister');
                  }, 
                  child: Text('Crear cuenta'),
                  textColor: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}