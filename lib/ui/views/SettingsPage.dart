import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:izmir_taksi/ui/cubit/ThemeNotifee.dart';
import 'package:izmir_taksi/utils/color.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> with TickerProviderStateMixin {
  late AnimationController controller;
  bool islight = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    var oran = MediaQuery.of(context);
    var genislik = oran.size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: genislik / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Çıkış Yap",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontWeight: FontWeight.bold,
                          fontSize: genislik / 19,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          SystemNavigator.pop();
                        },
                        child: Lottie.asset(
                          "assets/animation/exit.json",
                          width: genislik / 3,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "DARK~LIGHT",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontWeight: FontWeight.bold,
                          fontSize: genislik / 19,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await controller.animateTo(islight ? 1 : 0.5);
                          setState(() {
                            islight = !islight;
                          });
                          Future.microtask(() {
                            context.read<ThemeNotifier>().changetheme();
                          });
                        },
                        child: Lottie.asset(
                          "assets/animation/light.json",
                          width: genislik / 3,
                          fit: BoxFit.fill,
                          repeat: false,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
