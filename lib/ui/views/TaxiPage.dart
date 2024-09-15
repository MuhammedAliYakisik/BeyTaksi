import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izmir_taksi/ui/views/AnaSayfa.dart';
import 'package:izmir_taksi/utils/color.dart';

class Taxipage extends StatefulWidget {
  double lat;
  double lng;
  String taksiad;

  Taxipage(this.lat, this.lng, this.taksiad);

  @override
  State<Taxipage> createState() => _TaxipageState();
}

class _TaxipageState extends State<Taxipage> {
  Completer<GoogleMapController> haritakontrol = Completer();
  late CameraPosition konum;
  List<Marker> isaret = <Marker>[];
  List<Polyline> cizgiler = <Polyline>[];
  late BitmapDescriptor konumicon;
  late BitmapDescriptor yeniKonumicon;




  @override
  void initState() {
    super.initState();
    konum = CameraPosition(
      target: LatLng(37.8667, 32.5),
      zoom: 12,
    );
    iconolustur(context); // İkonları burada oluşturuyoruz
    konumagit();
  }
  iconolustur(context) async {
    ImageConfiguration configuration = createLocalImageConfiguration(context);

    // Mevcut ikon
    konumicon = await BitmapDescriptor.fromAssetImage(configuration, "assets/taxi.png");

    // Yeni ikon
    yeniKonumicon = await BitmapDescriptor.fromAssetImage(configuration, "assets/taxi.png");

    setState(() {}); // İkonlar oluşturulduktan sonra state'i güncelliyoruz
  }

  Future<void> konumagit() async {
    GoogleMapController controller = await haritakontrol.future;


    var isaretduurm = Marker(
      markerId: MarkerId("ID"),
      position: LatLng(widget.lat, widget.lng),
      infoWindow: InfoWindow(title: "${widget.taksiad}", snippet: "Hoşgeldiniz"),
      icon: konumicon,
    );


    var yeniIsaret = Marker(
      markerId: MarkerId("ID2"),
      position: LatLng(37.8667, 32.5),
      infoWindow: InfoWindow(title: "Konumunuz", snippet: ""),
    );


    var cizgi = Polyline(
      polylineId: PolylineId("cizgi1"),
      color: Colors.red,
      width: 5,
      points: [
        LatLng(widget.lat, widget.lng),
        LatLng(37.8667, 32.5),
      ],
    );

    setState(() {
      isaret.add(isaretduurm);
      isaret.add(yeniIsaret);
      cizgiler.add(cizgi);
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(konum));
    print("${widget.lat}");
    print("${widget.lng}");
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
              height: uzunluk / 1.1,
              width: genislik / 1,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(isaret),
                polylines: Set<Polyline>.of(cizgiler),
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
