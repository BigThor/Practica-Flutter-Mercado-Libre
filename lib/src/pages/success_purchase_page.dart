import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';

class SuccessPurchasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        color: Colors.green[400]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width:70.0,
                            height: 70.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: FadeInImage.memoryNetwork(
                                fit: BoxFit.fitWidth,
                                placeholder: kTransparentImage,
                                image: 'https://images-na.ssl-images-amazon.com/images/I/81qy%2BMXuxDL._AC_SL1392_.jpg',
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            '¡Excelente compra!',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Text(
                            'Llega entre el 21 y 24 de junio',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Colors.white,
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30.0,),
                          Text(
                            'Entrega',
                            style: TextStyle(
                              fontSize: 20.0
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'Cuando tu producto esté en camino te enviaremos un e-mail con el número de seguimiento',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}