import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_mercado_libre/src/widgets/custom_text_field.dart';

class CreditCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 240.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow[300]
                      ),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://i.redd.it/6dy6zo3bud811.png',
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          child: customTextField(
                            'Número de la tarjeta',
                            keyboardType: TextInputType.number
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          child: customTextField('Nombre y apellido',)
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          child: customTextField(
                            'Fecha de vencimiento',
                            keyboardType: TextInputType.datetime
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.0),
                          child: customTextField(
                            'Código de seguridad',
                            keyboardType: TextInputType.number
                          ),
                        ),
                      ], 
                      options: CarouselOptions(
                        enableInfiniteScroll: false
                      )
                    ),
                  ]),
                ),
              ],
            ),
            _confirmButtonsBottom(context)
          ],
        ),
      ),
    );
  }

  Widget _confirmButtonsBottom(context){
    return Positioned(
      bottom: 0.0,
      child: Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    'Anterior',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              )
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    'Siguiente',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/successPurchase');
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}