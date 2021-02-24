import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _drawerHeader(context),
          _botonDrawer(Icons.home_outlined, 'Inicio', context: context, ruta: '/'),
          _botonDrawer(Icons.search, 'Buscar'),
          _botonDrawer(Icons.shopping_bag_outlined, 'Mis compras'),
          _botonDrawer(Icons.account_circle_outlined, 'Mi cuenta'),
          _botonDrawer(Icons.money, 'Vender'),
          _botonDrawer(Icons.watch_later_outlined, 'Historial'),
          Divider(),
          _botonDrawer(Icons.list, 'Categorías'),
          _botonDrawer(Icons.food_bank_outlined, 'Supermercado'),
          _botonDrawer(Icons.storefront, 'Tiendas oficiales'),
          Divider(),
          _botonDrawer(Icons.help_outline, 'Ayuda'),
          Divider(),
          ListTile(title: Text('Acerca de Mercado Libre'))
        ],
      ),
    );
  }

  Widget _drawerHeader(context){
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: LayoutBuilder(builder: (context, constraint) {
                    return Icon(
                      Icons.account_circle_outlined,
                      color: Colors.grey,
                      size: constraint.biggest.height,
                    );
                  }),
                ),
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ingresa a tu cuenta\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        TextSpan(
                          text: 'Podrás ver detalles de envío y personalizar tu experiencia',
                        ),
                      ]
                    )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              //   foregroundColor: MaterialStateProperty.all(Colors.white)
              // ),
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              }, 
              child: Text('Ingresar'),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor
      ),
    );
  }

  Widget _botonDrawer(IconData icon, String texto, {BuildContext context, String ruta}){
    return ListTile(
      title: Text(texto),
      leading: Icon(icon),
      onTap: (){
        if(ruta != null && context != null && ruta != ''){
          Navigator.pushNamed(context, ruta);
        }
      },
    );
  }
}