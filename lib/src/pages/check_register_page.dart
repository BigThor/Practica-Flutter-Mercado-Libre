import 'package:flutter/material.dart';

class CheckRegisterPage extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  'Si aún no tienes cuenta, regístrate',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: 30.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Registrarme')
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/login');
                  }, 
                  child: Text('Ya tengo cuenta'),
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