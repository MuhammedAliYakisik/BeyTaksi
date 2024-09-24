import 'dart:ui';

enum CustomColors {
  blue,
  red,
  blue1,
  orange,
  blackRed,
  white,
  grey,
  blue2,
  whiteYellow,
  orange2,
  brown,
  whiteBrown,
  blue3,
  yellow,
  yellow2,
  yellow3,
  yellow4
}

extension CustomColorsExtension on CustomColors {
  Color get color {
    switch (this) {
      case CustomColors.blue:
        return const Color(0xff195073);
      case CustomColors.red:
        return const Color(0xffF23207);
      case CustomColors.blue1:
        return const Color(0xff96D2D9);
      case CustomColors.orange:
        return const Color(0xffF27B35);
      case CustomColors.blackRed:
        return const Color(0xff732509);
      case CustomColors.white:
        return const Color(0xffF0F0EC);
      case CustomColors.grey:
        return const Color(0x4A4AECC1);
      case CustomColors.blue2:
        return const Color(0xffC9DFF2);
      case CustomColors.whiteYellow:
        return const Color(0xffFED791);
      case CustomColors.orange2:
        return const Color(0xffD98B2B);
      case CustomColors.brown:
        return const Color(0xff8C521F);
      case CustomColors.whiteBrown:
        return const Color(0xffA66D60);
      case CustomColors.blue3:
        return const Color(0xff84B1D9);
      case CustomColors.yellow:
        return const Color(0xffF2E205);
      case CustomColors.yellow2:
        return const Color(0xffF2CB05);
      case CustomColors.yellow3:
        return const Color(0xffF2B705);
      case CustomColors.yellow4:
        return const Color(0xffF2BC79);
    }
  }
}

// Kullanım örneği
void main() {
  // Renk değerini almak için
  Color blueColor = CustomColors.blue.color;
  print('Mavi rengin hex kodu: 0x${blueColor.value.toRadixString(16)}');

  // Tüm renkleri listelemek için
  for (var colorEnum in CustomColors.values) {
    print('${colorEnum.name}: 0x${colorEnum.color.value.toRadixString(16)}');
  }
}