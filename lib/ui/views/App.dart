import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izmir_taksi/data/repo/TaksiRepo.dart';
import 'package:izmir_taksi/ui/cubit/AnasayfaCubit.dart';
import 'package:provider/provider.dart';
import 'package:izmir_taksi/ui/cubit/ThemeNotifee.dart';
import 'package:izmir_taksi/ui/views/SplashScreen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
        ),
        BlocProvider(
          create: (context) => AnasayfaCubit(TaksiRepo()),
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.currentTheme,
            home: Splashscreen(),
          );
        },
      ),
    );
  }
}
