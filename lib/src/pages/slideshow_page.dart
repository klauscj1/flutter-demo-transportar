import 'package:flutter/material.dart';

// import 'package:flutter_svg/svg.dart';
import 'package:transporte_app/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Colors.purple,
        // body: MiSlideshow(),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SafeArea(
                  child: FlatButton(
                    child: Text('Skip'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Expanded(child: MiSlideshow()),
          ],
        ));
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      // puntosArriba: true,
      //colorPrimario: Color(0xffFF5A7E),
      // colorSecundario: Colors.red,
      slides: <TarjetaModel>[
        TarjetaModel(
            //svg: SvgPicture.asset('assets/images/onboarding-1.svg'),
            svg: Image.asset('assets/images/onboarding-1.png'),
            texto:
                'Viaja, se un conductor o se un pasajero dentro de un viaje en una ciudad o entre ciudades',
            fin: false),
        TarjetaModel(
            // svg: SvgPicture.asset('assets/images/onboarding-2.svg'),
            svg: Image.asset('assets/images/onboarding-2.png'),
            texto: 'Paquetes, envia o recibe paquetes',
            fin: false),
        TarjetaModel(
            //svg: SvgPicture.asset('assets/images/onboarding-3.svg'),
            svg: Image.asset('assets/images/onboarding-3.png'),
            texto:
                'Exactitud, Podrás georeferenciar los puntos de entrega de un paquete o salida y llegada de un viaje',
            fin: true)
      ],
    );
  }
}
