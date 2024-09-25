import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izmir_taksi/data/repo/Taksi_Repo.dart';
import 'package:izmir_taksi/ui/cubit/Homepage_Cubit.dart';
import 'package:provider/provider.dart';
import 'package:izmir_taksi/ui/cubit/Theme_Notifier.dart';
import 'package:izmir_taksi/ui/views/Splash_Screen.dart';


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
          create: (context) => Homepagecubit(TaksiRepo()),
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
