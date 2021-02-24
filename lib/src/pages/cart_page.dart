import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

import 'package:app_mercado_libre/src/widgets/main_drawer.dart';
import 'package:app_mercado_libre/src/widgets/rich_text_envio_gratis_full.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.w300),
            unselectedLabelColor: Colors.grey[700],
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w100),
            indicatorColor: Colors.black,
            tabs: [
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Carrito (1)',
                  style: TextStyle(fontSize: 17.0,),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Guardados (0)',
                  style: TextStyle(fontSize: 17.0,),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _pageCarrito(context),
            _pageGuardados()
          ],
        ),
      ),
    );
  }

  Widget _pageCarrito(context){
    return Container(
      color: Colors.grey[200],
      child: Stack(
        children: [
          ListView(
            children: <Widget>[
              _itemCarrito()
            ],
          ),
          _continuarCompra(context)
        ],
      ),
    );
  }

  Widget _itemCarrito(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://images-na.ssl-images-amazon.com/images/I/81qy%2BMXuxDL._AC_SL1392_.jpg',
            ),
            title: Container(
              padding: EdgeInsets.only(top:10.0),
              child: Text('Juego de Mesa Monopoly')
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5.0,),
                RT_EnvioGratis_Full(),
                SizedBox(height: 15.0,),
                Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: Container(
                        padding: EdgeInsets.only(left: 15.0, top: 3.0,bottom: 3.0, right: 5.0),
                        decoration: new ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.0, 
                              style: BorderStyle.solid,
                              color: Colors.grey[200]
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                        ),
                        child: DropdownButton<int>(
                          isDense: true,
                          value: 1,
                          items: <int>[1].map<DropdownMenuItem<int>>((int value){
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.toString())
                            );
                          }).toList(),
                          onChanged: (value){}
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$ 349.98',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800]
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  'Eliminar',
                  style: TextStyle(
                    color: Colors.blueAccent
                  ),
                ),
                SizedBox(width: 20.0,),
                Text(
                  'Más productos del vendedor',
                  style: TextStyle(
                    color: Colors.blueAccent
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _continuarCompra(context){
    return Positioned(
      bottom: 0.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Envío a C.P.:78000, San Luis Potosí',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                Spacer(),
                Text(
                  'Gratis',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.green[600]
                    )
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Divider(),
            SizedBox(height: 5.0,),
            Row(
              children: [
                Text(
                  'Total con envío',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800]
                  ),
                ),
                Spacer(),
                Text(
                  '\$ 349.98',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800]
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0,),
            SizedBox(
              height: 45.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/address');
                }, 
                child: Text(
                  'Continuar compra',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pageGuardados(){
    return Container(
      padding: EdgeInsets.all(25.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25.0,),
          Text(
            'No tienes productos guardados',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 21.0
            ),
          ),
          SizedBox(height: 20.0,),
          Text(
            'Si aún no estás decidido en comprar algún producto de tu carrito, puedes dejarlo aquí.',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 15.5
            ),
          )
        ],
      ),
    );
  }
}