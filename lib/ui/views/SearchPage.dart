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
  List<Polyline> cizgiler = <Polyline>[];
  late BitmapDescriptor konumicon;
  StreamSubscription<Position>? konumTakibi;

  @override
  void initState() {
    super.initState();
    konum = CameraPosition(
      target: LatLng(37.8667, 32.5),
      zoom: 13,
    );
    konumagit();
    _konumTakipBaslat();
  }

  @override
  void dispose() {
    konumTakibi?.cancel();
    super.dispose();
  }

  iconolustur(context) {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(configuration, "assets/taxi.png").then((value) {
      setState(() {
        konumicon = value;
      });
    });
  }

  Future<void> konumagit() async {
    GoogleMapController controller = await haritakontrol.future;

    var isaretduurm = Marker(
      markerId: MarkerId("ID"),
      position: LatLng(widget.lat, widget.lng),
      infoWindow: InfoWindow(title: "${widget.taksiad}", snippet: "Hoşgeldiniz"),
    );


    var adliye = Marker(
      markerId: MarkerId("ID2"),
      position: LatLng(37.860722, 32.541628),
      infoWindow: InfoWindow(title: "Adliye Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.860722, 32.541628));
      },
    );
    var istasyon = Marker(
      markerId: MarkerId("ID3"),
      position: LatLng(37.865552, 32.476585),
      infoWindow: InfoWindow(title: "İstasyon Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.865552, 32.476585));
      },
    );
    var Yeniyol = Marker(
      markerId: MarkerId("ID4"),
      position: LatLng(37.869388, 32.473275),
      infoWindow: InfoWindow(title: "Yeniyol Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.869388, 32.473275));
      },
    );
    var yesilmeram = Marker(
      markerId: MarkerId("ID5"),
      position: LatLng(37.853112, 32.422485),
      infoWindow: InfoWindow(title: "YesilMeram Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.853112, 32.422485));
      },
    );
    var tip = Marker(
      markerId: MarkerId("ID6"),
      position: LatLng(37.884659, 32.432566),
      infoWindow: InfoWindow(title: "Tıp Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.884659, 32.432566),);
      },
    );
    var yeniotogar = Marker(
      markerId: MarkerId("ID7"),
      position: LatLng(37.949794, 32.508083),
      infoWindow: InfoWindow(title: "Yeni Otogar Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.949794, 32.508083));
      },
    );
    var ihsaniye = Marker(
      markerId: MarkerId("ID8"),
      position: LatLng(37.873103, 32.479836),
      infoWindow: InfoWindow(title: "İhsaniye Mobil Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.873103, 32.479836),);
      },
    );
    var yenimelik = Marker(
      markerId: MarkerId("ID9"),
      position: LatLng(37.871716, 32.457898),
      infoWindow: InfoWindow(title: "Yeni Melikşah Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.871716, 32.457898),);
      },
    );
    var inklap = Marker(
      markerId: MarkerId("ID10"),
      position: LatLng(37.872227, 32.486741),
      infoWindow: InfoWindow(title: "İnkilap Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.872227, 32.486741),);
      },
    );
    var soylemez = Marker(
      markerId: MarkerId("ID11"),
      position: LatLng(37.866094, 32.48988),
      infoWindow: InfoWindow(title: "Söylemez Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.866094, 32.48988),);
      },
    );
    var yakaalavardi = Marker(
      markerId: MarkerId("ID12"),
      position: LatLng(37.870665, 32.455951),
      infoWindow: InfoWindow(title: "Yaka Alavardı Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.870665, 32.455951),);
      },
    );
    var toki = Marker(
      markerId: MarkerId("ID13"),
      position: LatLng(37.988845, 32.482146),
      infoWindow: InfoWindow(title: "TOKİ Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.988845, 32.482146),);
      },
    );
    var havaalani = Marker(
      markerId: MarkerId("ID14"),
      position: LatLng(37.984553, 32.577109),
      infoWindow: InfoWindow(title: "Havaalanı Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.984553, 32.577109),);
      },
    );
    var selcukcami = Marker(
      markerId: MarkerId("ID15"),
      position: LatLng(37.873103, 32.479836),
      infoWindow: InfoWindow(title: "Selçuk Cami Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.873103, 32.479836),);
      },
    );
    var sahipata = Marker(
      markerId: MarkerId("ID16"),
      position: LatLng(37.867956, 32.494444),
      infoWindow: InfoWindow(title: "Sahipata Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.873103, 32.479836),);
      },
    );
    var sumer = Marker(
      markerId: MarkerId("ID17"),
      position: LatLng(37.871928, 32.501661),
      infoWindow: InfoWindow(title: "Sümer Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.871928, 32.501661),);
      },
    );
    var isik = Marker(
      markerId: MarkerId("ID18"),
      position: LatLng(37.889287, 32.482651),
      infoWindow: InfoWindow(title: "Işık Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.889287, 32.482651),);
      },
    );
    var stad = Marker(
      markerId: MarkerId("ID19"),
      position: LatLng(37.866879, 32.482435),
      infoWindow: InfoWindow(title: "Stad Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.866879, 32.482435),);
      },
    );
    var sekerlokali = Marker(
      markerId: MarkerId("ID20"),
      position: LatLng(37.879133, 32.469564),
      infoWindow: InfoWindow(title: "Şeker Lokali Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.879133, 32.469564),);
      },
    );
    var selcuklu = Marker(
      markerId: MarkerId("ID21"),
      position: LatLng(38.019925, 32.511237),
      infoWindow: InfoWindow(title: "Selçuklu Tıp Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(38.019925, 32.511237),);
      },
    );
    var has = Marker(
      markerId: MarkerId("ID22"),
      position: LatLng(37.878176, 32.490607),
      infoWindow: InfoWindow(title: "Has Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.878176, 32.490607),);
      },
    );
    var fuar = Marker(
      markerId: MarkerId("ID23"),
      position: LatLng(37.874456, 32.491046),
      infoWindow: InfoWindow(title: "Fuar Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.874456, 32.491046),);
      },
    );
    var bosna = Marker(
      markerId: MarkerId("ID24"),
      position: LatLng(38.011128, 32.52204),
      infoWindow: InfoWindow(title: "Bosna Hersek Taxi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(38.011128, 32.52204),);
      },
    );
    var askent = Marker(
      markerId: MarkerId("ID25"),
      position: LatLng(37.8706360891266, 32.4822709239582),
      infoWindow: InfoWindow(title: "Askent Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.8706360891266, 32.4822709239582),);
      },
    );
    var gazi = Marker(
      markerId: MarkerId("ID26"),
      position: LatLng(37.869103, 32.486432),
      infoWindow: InfoWindow(title: "Gazi Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.869103, 32.486432),);
      },
    );
    var fatih = Marker(
      markerId: MarkerId("ID27"),
      position: LatLng(37.896345, 32.485659),
      infoWindow: InfoWindow(title: "Fatih Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.896345, 32.485659),);
      },
    );
    var hilton = Marker(
      markerId: MarkerId("ID28"),
      position: LatLng(37.869164, 32.513426),
      infoWindow: InfoWindow(title: "Hilton Oteli Taksi", snippet: "Hoşgeldiniz"),
      icon: konumicon,
      onTap: () {
        _cizgiCiz(LatLng(widget.lat, widget.lng), LatLng(37.869164, 32.513426),);
      },
    );




    setState(() {
      isaret.add(isaretduurm);
      isaret.add(adliye);
      isaret.add(istasyon);
      isaret.add(Yeniyol);
      isaret.add(yesilmeram);
      isaret.add(tip);
      isaret.add(yeniotogar);
      isaret.add(ihsaniye);
      isaret.add(yenimelik);
      isaret.add(inklap);
      isaret.add(soylemez);
      isaret.add(yakaalavardi);
      isaret.add(toki);
      isaret.add(havaalani);
      isaret.add(selcukcami);
      isaret.add(sahipata);
      isaret.add(sumer);
      isaret.add(isik);
      isaret.add(stad);
      isaret.add(sekerlokali);
      isaret.add(selcuklu);
      isaret.add(has);
      isaret.add(fuar);
      isaret.add(bosna);
      isaret.add(askent);
      isaret.add(gazi);
      isaret.add(fatih);
      isaret.add(hilton);
    });

    controller.animateCamera(CameraUpdate.newCameraPosition(konum));
  }

  void _cizgiCiz(LatLng baslangic, LatLng bitis) {
    var cizgi = Polyline(
      polylineId: PolylineId("cizgi1"),
      color: Colors.red,
      width: 5,
      points: [
        baslangic,
        bitis,
      ],
    );

    setState(() {
      cizgiler.add(cizgi);
    });
  }


  Future<void> _konumTakipBaslat() async{
    konumTakibi = Geolocator.getPositionStream().listen((Position position) async {
      GoogleMapController controller = await haritakontrol.future;

      LatLng yeniKonum = LatLng(position.latitude, position.longitude);

      setState(() {

        isaret.removeWhere((m) => m.markerId == MarkerId("user_location"));
        isaret.add(
          Marker(
            markerId: MarkerId("user_location"),
            position: yeniKonum,
            infoWindow: InfoWindow(title: "Mevcut Konumunuz"),
            icon: konumicon,
          ),
        );
      });


      controller.animateCamera(CameraUpdate.newLatLng(yeniKonum));
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
                polylines: Set<Polyline>.of(cizgiler),
                initialCameraPosition: konum,
                myLocationEnabled: true,
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
