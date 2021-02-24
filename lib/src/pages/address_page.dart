import 'package:flutter/material.dart';

import 'package:app_mercado_libre/src/widgets/custom_text_field.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[300]
                ),
              ),
              title: Text(
                'Agrega un domicilio',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17.0
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _inputs(context),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _inputs(context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTextField(
            'Nombre y apellido', 
            helperText: 'Tal cual figure en el INE o IFE'
          ),
          customTextField('Código postal', keyboardType: TextInputType.number),
          customTextField('Estado', enabled: false),
          customTextField('Delegación / Municipio', enabled: false),
          customTextField('Colonia / Asentamiento'),
          customTextField('Calle'),
          customTextField('N° exterior'),
          customTextField('N° interior / Depto (opcional)'),
          SizedBox(height: 30.0,),
          Text(
            '¿Entre que calles estás? (opcional)',
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          customTextField('Calle 1'),
          customTextField('Calle 2'),
          SizedBox(height: 30.0,),
          Text(
            '¿Es tu trabajo o tu casa?',
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          Row(
            children: [
              Radio(
                value: 0,
                groupValue: 0,
                onChanged: (value){},
              ),
              Text('Trabajo')
            ],
          ),
          Row(
            children: [
              Radio(
                value: 0,
                groupValue: 1,
                onChanged: (value){},
              ),
              Text('Casa')
            ],
          ),
          SizedBox(height: 50.0,),
          customTextField(
            'Télefono de contacto', 
            helperText: 'Llamarán a este número si hay algún problema en el envío',
            hintText: 'Ej.: 222 1234567'
          ),
          Text(
            'Indicaciones adicionales para entregar tus compras en esta dirección',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 20.0,),
          TextField(
            maxLength: 128,
            minLines: 3,
            maxLines: 20,
            decoration: InputDecoration(
              hintText: 'Descripción de la fachada, puntos de referencia para encontrarla, indicaciones de seguridad, etc.',
              hintStyle: TextStyle(color: Colors.grey[400]),
              helperMaxLines: 2,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.solid, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent)
              ),
            ),
          ),
          SizedBox(height: 30.0,),
          SizedBox(
            height: 45.0,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/creditCard');
              }, 
              child: Text(
                'Continuar',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400
                ),
              )
            ),
          ),
          SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}