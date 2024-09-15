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

  Searchpage(this.lat, this.lng, this.taksiad);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  Completer<GoogleMapController> haritakontrol = Completer();
  late CameraPosition konum;
  List<Marker> isaret = <Marker>[];
  List<Polyline> cizgiler = <Polyline>[]; // Çizgi listesi
  late BitmapDescriptor konumicon;

  iconolustur(context) {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(configuration, "assets/taxi.png").then((value) {
      setState(() {
        konumicon = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    konum = CameraPosition(
      target: LatLng(37.8667, 32.5), // Başlangıç pozisyonu
      zoom: 10,
    );
    konumagit();
  }

  Future<void> konumagit() async {
    GoogleMapController controller = await haritakontrol.future;

    // İlk marker (widget.lat, widget.lng)
    var isaretduurm = Marker(
      markerId: MarkerId("ID"),
      position: LatLng(widget.lat, widget.lng),
      infoWindow: InfoWindow(title: "${widget.taksiad}", snippet: "Hoşgeldiniz"),
    );

    // Yeni marker (37.853112, 32.422485)
    var adliye = Marker(
      markerId: MarkerId("ID2"),
      position: LatLng(37.860722, 32.541628),
      infoWindow: InfoWindow(title: "Adliye Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.860722, 32.541628));
      }, // Tıklanınca çizgi çizen fonksiyon
    );
    var istasyon = Marker(
      markerId: MarkerId("ID3"),
      position: LatLng(37.865552, 32.476585),
      infoWindow: InfoWindow(title: "İstasyon Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.865552, 32.476585));
      }, // Tıklanınca çizgi çizen fonksiyon
    );
    var Yeniyol = Marker(
      markerId: MarkerId("ID4"),
      position: LatLng(37.869388, 32.473275),
      infoWindow: InfoWindow(title: "Yeniyol Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.869388, 32.473275));
      }, // Tıklanınca çizgi çizen fonksiyon
    );
    var yesilmeram = Marker(
      markerId: MarkerId("ID5"),
      position: LatLng(37.853112, 32.422485),
      infoWindow: InfoWindow(title: "YesilMeram Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.853112, 32.422485));
      }, // Tıklanınca çizgi çizen fonksiyon
    );

    setState(() {
      isaret.add(isaretduurm);
      isaret.add(adliye); // Yeni marker'ı listeye ekledik
      isaret.add(istasyon);
      isaret.add(Yeniyol);
      isaret.add(yesilmeram);
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(konum));
  }

  // Çizgi çizme fonksiyonu
  void _cizgiCiz(LatLng baslangic, LatLng bitis) {
    var cizgi = Polyline(
      polylineId: PolylineId("cizgi1"),
      color: Colors.red, // Çizgi rengi
      width: 5, // Çizgi kalınlığı
      points: [
        baslangic, // Başlangıç konumu (seçili marker)
        bitis, // Bitiş konumu (tıklanılan marker)
      ],
    );

    setState(() {
      cizgiler.add(cizgi); // Çizgiyi ekliyoruz
    });
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
                polylines: Set<Polyline>.of(cizgiler), // Çizgileri haritaya ekliyoruz
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
