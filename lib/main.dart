import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izmir_taksi/ui/cubit/AnaSayfa_cubit.dart';
import 'package:izmir_taksi/ui/views/AnaSayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const IlkEkran(),
      ),
    );
  }
}

class IlkEkran extends StatefulWidget {
  const IlkEkran({super.key});

  @override
  _IlkEkranState createState() => _IlkEkranState();
}

class _IlkEkranState extends State<IlkEkran> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleScaleAnimation;
  late Animation<double> _imageScaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();


    Future.delayed(const Duration(seconds: 9), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Anasayfa()),
      );
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    );

    _circleScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _imageScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.14, 1.0, curve: Curves.easeInOut),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.14, 1.0, curve: Curves.easeInOut),
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment(0, -0.4),
              child: FadeTransition(
                opacity: _textOpacityAnimation,
                child: Text(
                  'Taksi İzmir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 20.0,
                        color: Colors.white.withOpacity(0.7),
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _circleScaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _circleScaleAnimation.value,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _imageScaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _imageScaleAnimation.value,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Image.asset(
                      'assets/taxiBlack.png',
                      width: 160,
                      height: 160,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
