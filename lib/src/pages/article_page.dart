import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:app_mercado_libre/src/widgets/main_drawer.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        title: Container(
          child: Text(
            'Producto',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: (){
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              children: [
                SizedBox(height: 45.0,),
                Text(
                  'Nuevo | 32 vendidos',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Juego de Mesa Monopoly',
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                ),
                _carouselArticle(),
                _textsPrice(context),
                _deliver1(context),
                _deliver2(context),
                _seller(context),
                SizedBox(height:15.0),
                Text(
                  'Stock disponible',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16.0),
                ),
                SizedBox(height:25.0),
                _buyButtons(context),
                SizedBox(height:25.0),
                _extraInfoSale(),
                _buttonsRow(),
                Divider(),
                _productInfo(),
                Divider(),
                _description(),
                Divider(),
                _devolution(),
                Divider(),
                _warranty(),
                Divider(),
                _paymentOptions(),
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

  Widget _carouselArticle(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: CarouselSlider(
        items: [
          _carouselImg('https://images-na.ssl-images-amazon.com/images/I/81qy%2BMXuxDL._AC_SL1392_.jpg'),
          _carouselImg('https://cf.geekdo-images.com/imagepage/img/LSgq7oXHuH2p7etJVGBKJ_fDbvg=/fit-in/900x600/filters:no_upscale()/pic709056.jpg'),
          _carouselImg('https://www.pngkit.com/png/full/501-5012412_game-monopoly-hasbro-monopoly-board-game.png',),
          _carouselImg('https://www.thesprucecrafts.com/thmb/vdfOSM3_3Gyt9A4Jfq_bD-onpIY=/1333x1000/smart/filters:no_upscale()/how-much-money-does-bank-have-411884_hero_2956-11d103db768048cdb1c216c3bd397b2b.jpg',),
          _carouselImg('https://i0.wp.com/www.thesun.co.uk/wp-content/uploads/2017/01/nintchdbpict0003023364961.jpg?crop=266px%2C1291px%2C3075px%2C2050px&resize=1200%2C800&ssl=1')
        ],
        options: CarouselOptions(
          enableInfiniteScroll: false
        )
      ),
      // child:
    );
  }

  Widget _carouselImg(String url){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: url,
      ),
    );
  }

  Widget _textsPrice(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\$ 349.98',
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height:5.0),
        Text(
          'en 12x \$ 35.10',
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 17.0),
        ),
        SizedBox(height:5.0),
        Text('IVA incluido'),
        SizedBox(height:5.0),
        Text(
          'Ver los medios de pago',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }

  Widget _deliver1(context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.directions_bus_outlined,
            color: Colors.green[600],
          ),
          SizedBox(width:10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.green[600], fontSize: 16.0),
                  children: [
                    TextSpan(text: 'Llega gratis '),
                    TextSpan(
                      text: 'el jueves ',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      )
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.electric_rickshaw_rounded,
                        size: 17.0,
                        color: Colors.green[600],
                      ),
                    ),
                    TextSpan(
                      text: ' FULL',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(height:5.0),
              Text(
                'Beneficio de Mercado Puntos',
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              SizedBox(height:5.0),
              Text(
                'Ver más formas de entrega',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _deliver2(context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.storefront_outlined,
            color: Colors.green[600],
          ),
          SizedBox(width:10.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.green[600], fontSize: 16.0),
                    children: [
                      TextSpan(text: 'Retíralo gratis '),
                      TextSpan(
                        text: 'a partir del jueves ',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        )
                      ),
                      TextSpan(text: 'en correos y otros puntos'),
                    ],
                  ),
                ),
                SizedBox(height:5.0),
                Text(
                  'Beneficio de Mercado Puntos',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
                SizedBox(height:5.0),
                Text(
                  'Ver en el mapa',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _seller(context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: 'Vendido por '),
                TextSpan(
                  text: 'PADISHOP',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            'MercadoLíder | 1,670 ventas'
          ),
        ],
      )
    );
  }

  Widget _buyButtons(context){
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 45.0,
            child: FlatButton(
              onPressed: (){},
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                      children: [
                        TextSpan(text: 'Cantidad: '),
                        TextSpan(
                          text: '1   ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '(21 disponibles)',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height:20.0),
          SizedBox(
            width: double.infinity,
            height: 45.0,
            child: FlatButton(
              onPressed: (){},
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                'Comprar ahora',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16.0
                ),
              ),
            ),
          ),
          SizedBox(height:8.0),
          SizedBox(
            width: double.infinity,
            height: 45.0,
            child: FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/cart');
              },
              color: Colors.blue[100],
              child: Text(
                'Agregar al carrito',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16.0
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _extraInfoSale(){
    return Column(
      children: [
        _textInfoSale(
          Icons.replay, 
          'Devolución gratis. ', 
          'Tienes 30 días desde que lo recibes.'
        ),
        _textInfoSale(
          Icons.security_outlined, 
          'Compra Protegida, ', 
          'recibe el producto que esperabas o te devolvemos tu dinero.'
        ),
        _textInfoSale(
          Icons.shopping_basket_outlined,
          'Mercado Puntos. ', 
          'Sumas 17 puntos.'
        ),
        _textInfoSale(
          Icons.text_snippet_outlined,
          '', 
          '3 meses de garantía de fábrica.'
        ),
      ],
    );
  }

  Widget _textInfoSale(IconData icon, String blueText, String normalText){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 20.0,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13.5),
                  children: [
                    TextSpan(
                      text: blueText,
                      style: TextStyle(
                        color: Colors.blueAccent
                      )
                    ),
                    TextSpan(
                      text: normalText,
                      style: TextStyle(
                        color: Colors.grey
                      )
                    ),
                  ]
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonsRow(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          FlatButton(
            child: Row(
              children: [
                Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 5.0,),
                Text(
                  'Agregar a favoritos',
                  style: TextStyle(
                    color:Colors.blueAccent,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
            onPressed: (){},
          ),
          FlatButton(
            child: Row(
              children: [
                Icon(
                  Icons.share_outlined,
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 5.0,),
                Text(
                  'Compartir',
                  style: TextStyle(
                    color:Colors.blueAccent,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
            onPressed: (){},
          )
        ],
      ),
    );
  }

  Widget _productInfo(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Información del producto',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 30.0,),
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Table(
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  children: [
                    _tableText('Marca', fontWeight: FontWeight.w600),
                    _tableText('Mattel')
                  ]
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100]
                  ),
                  children: [
                    _tableText('Nombre', fontWeight: FontWeight.w600),
                    _tableText('Monopoly')
                  ]
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[300]
                  ),
                  children: [
                    _tableText('Edición', fontWeight: FontWeight.w600),
                    _tableText('Estandard')
                  ]
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100]
                  ),
                  children: [
                    _tableText('Modelo alfanumérico', fontWeight: FontWeight.w600),
                    _tableText('JCA-2418')
                  ]
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          _outlinedButtonText('Ver más características')
        ],
      ),
    );
  }

  Widget _tableText(String text, {FontWeight fontWeight}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical:15.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: fontWeight,
        ),
      )
    );
  }

  Widget _outlinedButtonText(String text){
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: null, 
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: Colors.blueAccent,
              ),
            ],
          ),
        )
      ),
    );
  }

  
  Widget _description(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descripción',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 20.0,),
          Text(
            'Juega y diviertéte en familia con este grandioso juego de comprar y vender. Ganando la mayor cantidad de dinero con la compra y renta de propiedades, cumpliendo los retos de las tarjetas, para así vencer a los demás jugadores.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _devolution(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Devolución gratis',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 20.0,),
          Text(
            'Tienes 30 días desde que recibes el producto para devolverlo. ¡No importa el motivo!',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey
            ),
          ),
          SizedBox(height: 20.0,),
          _outlinedButtonText('Conocer más sobre devoluciones')
        ],
      ),
    );
  }

  Widget _warranty(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Garantía',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 20.0,),
          Text(
            'Compra Protegida con Mercado Pago',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0,),
          Text(
            'Recibe el producto que esperabas o te devolvemos tu dinero',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey
            ),
          ),
          SizedBox(height: 20.0,),
          Text(
            'Garantía del vendedor',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0,),
          Text(
            'Garantía de fábrica: 3 meses',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey
            ),
          ),
          SizedBox(height: 20.0,),
          _outlinedButtonText('Conocer más sobre garantía')
        ],
      ),
    );
  }
  
  Widget _paymentOptions(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Medios de pago',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'Tarjetas de crédito',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            '¡Paga en hasta 12 meses!',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey
            ),
          ),
          Row(
            children: [
              _miniImgPayment('https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png'),
              _miniImgPayment('https://assets.stickpng.com/thumbs/58482363cef1014c0b5e49c1.png'),
              _miniImgPayment('https://marketing4ecommerce.mx/wp-content/uploads/2014/11/AmericanExpressGdeOk-1280x720.jpg'),
            ],
          ),
          SizedBox(height: 20.0,),
          Text(
            'Tarjetas de débito',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Row(
            children: [
              _miniImgPayment('https://assets.stickpng.com/thumbs/58482363cef1014c0b5e49c1.png'),
              _miniImgPayment('https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png'),
            ],
          ),
          SizedBox(height: 20.0,),
          Text(
            'Efectivo',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          _miniImgPayment('https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Oxxo_Logo.svg/1024px-Oxxo_Logo.svg.png'),
          SizedBox(height: 20.0,),
          _outlinedButtonText('Conocer otros medios de pago')
        ],
      ),
    );
  }

  Widget _miniImgPayment(String url){
    return Container(
      width: 80.0,
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: FadeInImage.memoryNetwork(
        fit: BoxFit.fitWidth,
        placeholder: kTransparentImage,
        image: url,
      ),
    );
  }

}