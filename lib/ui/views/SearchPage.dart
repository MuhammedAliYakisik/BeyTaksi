import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izmir_taksi/utils/color.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    var oran = MediaQuery.of(context);
    var genislik = oran.size.width;
    var uzunluk = oran.size.height;
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text("google harita gelecek ve izmir şehrinden herhangi bir konumda bulunulacak")
          ],
        ),
      ),
    );
  }
}
