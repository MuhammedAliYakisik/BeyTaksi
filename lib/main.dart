import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';  // Provider ekledim
import 'package:izmir_taksi/ui/cubit/AnaSayfa_cubit.dart';
import 'package:izmir_taksi/ui/cubit/ThemeNotifee.dart';
import 'package:izmir_taksi/ui/views/SplashScreen.dart';
import 'data/repo/taksi_repo.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),  // ThemeNotifier'ı ekledim
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
