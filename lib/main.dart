import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izmir_taksi/ui/cubit/AnaSayfa_cubit.dart';
import 'package:izmir_taksi/ui/views/AnaSayfa.dart';
import 'package:izmir_taksi/ui/views/SplashScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'data/repo/taksi_repo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnasayfaCubit(TaksiRepo()), // TaksiRepo'yu buraya geçmelisiniz
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Splashscreen(),
      ),
    );
  }
}
