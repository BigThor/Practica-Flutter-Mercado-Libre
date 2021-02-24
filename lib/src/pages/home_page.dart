import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:app_mercado_libre/src/widgets/main_drawer.dart';
import 'package:app_mercado_libre/src/widgets/rich_text_envio_gratis_full.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        title: Container(
          height: 40.0,
          child: TextField(
            enabled: false,
            onTap: (){},
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_outlined),
              labelText: 'Buscar en Mercado Libre',
              labelStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
                borderSide: BorderSide.none
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: (){
              Navigator.pushNamed(context, '/cart');
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: ListView(
              children: [
                SizedBox(height: 45.0,),
                _mainCarousel(context),
                _listIconButtons(),
                _cardSeenRecently(
                  context, 
                  'https://images-na.ssl-images-amazon.com/images/I/81qy%2BMXuxDL._AC_SL1392_.jpg',
                  'Juego de Mesa Monopoly', 349.98,
                  20
                ),
                _mercadoPagoDiscountsCard(context),
                _cardSeenRecently(
                  context, 
                  'https://clmoto.vteximg.com.br/arquivos/ids/157189-1000-1000/05-moto-g7-power-32gb-azul-navy.png?v=636862757331500000',
                  'Motorola g7 Power',3799.00, 10
                ),
              ]
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 45.0,
              child: ListTile(
                dense: true,
                leading: Icon(Icons.location_on_outlined, size: 18.0,),
                trailing: Icon(Icons.arrow_forward_ios, size: 18.0,),
                title: Text('Ingresa tu código postal'),
                tileColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ]
      ),
    );
  }

  Widget _mainCarousel(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Theme.of(context).primaryColor, Colors.white]
        )
      ),
      child: CarouselSlider(
        items: <Widget>[
          _carouselCard('https://picsum.photos/id/0/700/300'),
          _carouselCard('https://picsum.photos/id/119/700/300'),
          _carouselCard('https://picsum.photos/id/1068/700/300'),
        ],
        options: CarouselOptions(
          height: 150.0,
        ),
      ),
    );
  }

  Widget _carouselCard(String url){
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Card(
        elevation: 2.0,
        clipBehavior: Clip.antiAlias,
        child: FittedBox(
          fit: BoxFit.fill,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: url,
          ),
        )
      ),
    );
  }

  Widget _listIconButtons(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _circularIconButton(Icons.qr_code, 'Pagar con QR'),
          _circularIconButton(Icons.monetization_on_outlined, 'Ofertas'),
          _circularIconButton(Icons.food_bank_outlined, 'Súper'),
          _circularIconButton(Icons.directions_car_outlined, 'Autos, motos y otros'),
          _circularIconButton(Icons.add, 'Ver más'),
        ],
      ),
    );
  }

  Widget _circularIconButton(IconData icon, String text){
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: MaterialButton(
              child: Icon(
                icon,
                color: Colors.grey,
              ),
              onPressed: (){},
              color: Colors.white,
              shape: CircleBorder(),
              padding: EdgeInsets.all(16),
            ),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 10.0, ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _cardSeenRecently(context, String urlImagen, String productName, double price, int discount){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Card(
        elevation: 7.0,
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Visto recientemente',
                style: Theme.of(context).textTheme.headline6,
              ),
              Divider(),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/article');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: urlImagen,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        productName,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        '\$'+ price.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Text(
                      discount.toString() + '% OFF',
                      style: TextStyle(color:Colors.green[600]),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: RT_EnvioGratis_Full(),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: (){}, 
                  child: Row(
                    children: [
                      Text(
                        'Ver historial de navegación',
                        style: TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).colorScheme.primary,
                        size: 17.0,
                      )
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mercadoPagoDiscountsCard(context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Card(
        elevation: 7.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Descuentos con Mercado Pago',
                  style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 17.0),
                ),
              ),
              Divider(),
              SizedBox(height:25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _mpdiscountColumn(
                    context,
                    'https://media-exp1.licdn.com/dms/image/C560BAQHGHDX5r7HUrQ/company-logo_200_200/0?e=2159024400&v=beta&t=tzphBDsJoLGulx5ocnJSvZBUhFuBebmThFNMoaRBVPA',
                    '\$ 75'
                  ),
                  _mpdiscountColumn(
                    context,
                    'https://scontent.fgdl4-1.fna.fbcdn.net/v/t1.0-9/62075907_2715391538535397_1543277600237944832_n.png?_nc_cat=100&ccb=2&_nc_sid=09cbfe&_nc_ohc=R4K1W6sV8TEAX9WbkTa&_nc_ht=scontent.fgdl4-1.fna&oh=1f59ee72e02c8a37e248eea43b74412a&oe=5FD74690',
                    '25% OFF'
                  ),
                  _mpdiscountColumn(
                    context,
                    'https://pbs.twimg.com/profile_images/688017159335862272/i8-e0oEr_400x400.jpg',
                    '35% OFF'
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _mpdiscountColumn(
                    context,
                    'https://pbs.twimg.com/profile_images/1145468362371346432/oXgyv24b_400x400.jpg',
                    '25% OFF'
                  ),
                  _mpdiscountColumn(
                    context,
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/7-eleven_logo.svg/1200px-7-eleven_logo.svg.png',
                    '\$ 20'
                  ),
                  _mpdiscountColumn(
                    context,
                    'https://pbs.twimg.com/profile_images/1052606730553581570/ppnHQdb1_400x400.jpg',
                    '\$ 20'
                  ),
                ],
              ),
              SizedBox(height: 25.0,),
              Container(
                padding: EdgeInsets.all(15.0),
                color: Colors.grey[100],
                child: Row(
                  children: [
                    Container(
                      width: 35.0,
                      child: FadeInImage.memoryNetwork(
                        fit: BoxFit.fitHeight,
                        placeholder: kTransparentImage,
                        image: 'https://smarttravel.io/images/logo-mp.png',
                      ),
                    ),
                    SizedBox(width:15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Exclusivo con'),
                        Text('Mercado Pago'),
                      ],
                    ),
                    Spacer(),
                    FlatButton(
                      child: Text(
                        'Descargar',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary
                        ),
                      ),
                      onPressed: (){},
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _mpdiscountColumn(context, String url, String discountText){
    return Column(
      children: [
        Container(
          width:55.0,
          height: 55.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.fill,
              placeholder: kTransparentImage,
              image: url,
            ),
          ),
        ),
        SizedBox(height:10.0),
        Text(
          'Hasta',
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          discountText,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 15.0),
        )
      ],
    );
  }
}