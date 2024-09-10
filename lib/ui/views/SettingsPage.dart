import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izmir_taksi/generated/locale_keys.g.dart';
import 'package:izmir_taksi/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
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

            Text(LocaleKeys.anasayfa_body.tr()),
            Text(LocaleKeys.anasayfa_title.tr()),

            ElevatedButton(onPressed: (){
              context.setLocale(Locale("tr","TR"));
            }, child: Text("Türkçe Yap")),

            ElevatedButton(onPressed: (){
              context.setLocale(Locale("en","US"));
            }, child: Text("İngilizce yap")),

          ],
        ),
      ),
    );
  }
}
