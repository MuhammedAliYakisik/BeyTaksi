import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izmir_taksi/ui/views/AnaSayfa.dart';
import 'package:izmir_taksi/utils/color.dart';

class Searchpage extends StatefulWidget {
  double lat;
  double lng;
  String taksiad;


  Searchpage(this.lat, this.lng,this.taksiad);

  @override
  State<Searchpage> createState() => _SearchpageState();
}


class _SearchpageState extends State<Searchpage> {
  Completer<GoogleMapController> haritakontrol = Completer();
  late CameraPosition konum;
  List<Marker> isaret = <Marker>[];
  late BitmapDescriptor konumicon;


  iconolustur(context){
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(configuration, "assets/taxi.png").then((value){
      setState(() {
        konumicon = value;
      });
    });
  }




  @override
  void initState() {
    super.initState();
    konum = CameraPosition(
      target: LatLng(widget.lat, widget.lng),
      zoom: 13,
    );
    konumagit();
  }

  Future<void> konumagit() async {
    GoogleMapController controller = await haritakontrol.future;

    var isaretduurm = Marker(
      markerId: MarkerId("ID"),
      position: LatLng(widget.lat, widget.lng),
      infoWindow: InfoWindow(title: "${widget.taksiad}",snippet: "Hoşgeldiniz"),icon: konumicon);
    setState(() {
      isaret.add(isaretduurm);
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(konum));
  }

  @override
  Widget build(BuildContext context) {
    iconolustur(context);
    var oran = MediaQuery.of(context);
    var genislik = oran.size.width;
    var uzunluk = oran.size.height;

    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: uzunluk / 1.3,
              width: genislik / 1,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(isaret),
                initialCameraPosition: konum,
                onMapCreated: (GoogleMapController controller) {
                  haritakontrol.complete(controller);
                },
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: genislik / 10,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Anasayfa(),
                            ),
                          );
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

