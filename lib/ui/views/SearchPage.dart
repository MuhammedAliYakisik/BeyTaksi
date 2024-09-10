import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izmir_taksi/utils/color.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  //AIzaSyBW8Q_eAnt_G0WIqLMwakwFwtqgNaWWULM
  Completer<GoogleMapController> haritakontrol = Completer();
  var konum = CameraPosition(target: LatLng(38.123,26.213),zoom: 4);

  List<Marker> isaret = <Marker>[];

  Future<void> konumagit() async {
    GoogleMapController controller = await haritakontrol.future;
    var gidilecekkonum = CameraPosition(target: LatLng(37.8667,32.5),zoom: 13);

    var isaretduurm = Marker(
      markerId: MarkerId("ID"),
      position: LatLng(37.8667,32.5),
      infoWindow: InfoWindow(title: "Konum",snippet: "Şuanki Konumunuz"));
    setState(() {
      isaret.add(isaretduurm);
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(gidilecekkonum));


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    konumagit();
  }

  @override
  Widget build(BuildContext context) {
    var oran = MediaQuery.of(context);
    var genislik = oran.size.width;
    var uzunluk = oran.size.height;

    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          children: <Widget>[

            SizedBox(
              height: 600,
              width: 500,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(isaret),
                initialCameraPosition: konum,
                onMapCreated: (GoogleMapController controller){
                  haritakontrol.complete(controller);
                }
              ),
            )



          ],
        ),
      ),
    );
  }
}
