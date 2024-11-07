import 'package:flutter/material.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.moreLightGray,
    required this.lighterGray,
    required this.mainBlue,
    required this.primaryColor,
    required this.black,
    required this.white,
    required this.lightBlue,
    required this.greyDark,
    required this.blue,
    required this.teal,
    required this.greyMedium,
    required this.greyLight,
    required this.blackSoft,
    required this.greyish,
    required this.greyLighter,
    required this.greyDark2,
    required this.orangeBright,
    required this.yellowGold,
    required this.orange,
    required this.yellowBright,
    required this.blueLight,
    required this.maroon,
    required this.blueDark,
    required this.yellowSoft,
    required this.blueAccent,
    required this.redBright,
    required this.greenBright,
    required this.yellowLight,
    required this.greyDeep,
    required this.greySteel,
    required this.brown,
    required this.greyMild,
  });

  final Color moreLightGray;
  final Color lighterGray;
  final Color mainBlue;
  final Color primaryColor;
  final Color black;
  final Color white;
  final Color lightBlue;
  final Color greyDark;
  final Color blue;
  final Color teal;
  final Color greyMedium;
  final Color greyLight;
  final Color blackSoft;
  final Color greyish;
  final Color greyLighter;
  final Color greyDark2;
  final Color orangeBright;
  final Color yellowGold;
  final Color orange;
  final Color yellowBright;
  final Color blueLight;
  final Color maroon;
  final Color blueDark;
  final Color yellowSoft;
  final Color blueAccent;
  final Color redBright;
  final Color greenBright;
  final Color yellowLight;
  final Color greyDeep;
  final Color greySteel;
  final Color brown;
  final Color greyMild;

  @override
  MyColors copyWith({
    Color? moreLightGray,
    Color? lighterGray,
    Color? mainBlue,
    Color? primaryColor,
    Color? black,
    Color? white,
    Color? lightBlue,
    Color? greyDark,
    Color? blue,
    Color? teal,
    Color? greyMedium,
    Color? greyLight,
    Color? blackSoft,
    Color? greyish,
    Color? greyLighter,
    Color? greyDark2,
    Color? orangeBright,
    Color? yellowGold,
    Color? orange,
    Color? yellowBright,
    Color? blueLight,
    Color? maroon,
    Color? blueDark,
    Color? yellowSoft,
    Color? blueAccent,
    Color? redBright,
    Color? greenBright,
    Color? yellowLight,
    Color? greyDeep,
    Color? greySteel,
    Color? brown,
    Color? greyMild,
  }) {
    return MyColors(
      moreLightGray: moreLightGray ?? this.moreLightGray,
      lighterGray: lighterGray ?? this.lighterGray,
      mainBlue: mainBlue ?? this.mainBlue,
      primaryColor: primaryColor ?? this.primaryColor,
      black: black ?? this.black,
      white: white ?? this.white,
      lightBlue: lightBlue ?? this.lightBlue,
      greyDark: greyDark ?? this.greyDark,
      blue: blue ?? this.blue,
      teal: teal ?? this.teal,
      greyMedium: greyMedium ?? this.greyMedium,
      greyLight: greyLight ?? this.greyLight,
      blackSoft: blackSoft ?? this.blackSoft,
      greyish: greyish ?? this.greyish,
      greyLighter: greyLighter ?? this.greyLighter,
      greyDark2: greyDark2 ?? this.greyDark2,
      orangeBright: orangeBright ?? this.orangeBright,
      yellowGold: yellowGold ?? this.yellowGold,
      orange: orange ?? this.orange,
      yellowBright: yellowBright ?? this.yellowBright,
      blueLight: blueLight ?? this.blueLight,
      maroon: maroon ?? this.maroon,
      blueDark: blueDark ?? this.blueDark,
      yellowSoft: yellowSoft ?? this.yellowSoft,
      blueAccent: blueAccent ?? this.blueAccent,
      redBright: redBright ?? this.redBright,
      greenBright: greenBright ?? this.greenBright,
      yellowLight: yellowLight ?? this.yellowLight,
      greyDeep: greyDeep ?? this.greyDeep,
      greySteel: greySteel ?? this.greySteel,
      brown: brown ?? this.brown,
      greyMild: greyMild ?? this.greyMild,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) return this;
    return MyColors(
      moreLightGray: Color.lerp(moreLightGray, other.moreLightGray, t)!,
      lighterGray: Color.lerp(lighterGray, other.lighterGray, t)!,
      mainBlue: Color.lerp(mainBlue, other.mainBlue, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      greyDark: Color.lerp(greyDark, other.greyDark, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      teal: Color.lerp(teal, other.teal, t)!,
      greyMedium: Color.lerp(greyMedium, other.greyMedium, t)!,
      greyLight: Color.lerp(greyLight, other.greyLight, t)!,
      blackSoft: Color.lerp(blackSoft, other.blackSoft, t)!,
      greyish: Color.lerp(greyish, other.greyish, t)!,
      greyLighter: Color.lerp(greyLighter, other.greyLighter, t)!,
      greyDark2: Color.lerp(greyDark2, other.greyDark2, t)!,
      orangeBright: Color.lerp(orangeBright, other.orangeBright, t)!,
      yellowGold: Color.lerp(yellowGold, other.yellowGold, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      yellowBright: Color.lerp(yellowBright, other.yellowBright, t)!,
      blueLight: Color.lerp(blueLight, other.blueLight, t)!,
      maroon: Color.lerp(maroon, other.maroon, t)!,
      blueDark: Color.lerp(blueDark, other.blueDark, t)!,
      yellowSoft: Color.lerp(yellowSoft, other.yellowSoft, t)!,
      blueAccent: Color.lerp(blueAccent, other.blueAccent, t)!,
      redBright: Color.lerp(redBright, other.redBright, t)!,
      greenBright: Color.lerp(greenBright, other.greenBright, t)!,
      yellowLight: Color.lerp(yellowLight, other.yellowLight, t)!,
      greyDeep: Color.lerp(greyDeep, other.greyDeep, t)!,
      greySteel: Color.lerp(greySteel, other.greySteel, t)!,
      brown: Color.lerp(brown, other.brown, t)!,
      greyMild: Color.lerp(greyMild, other.greyMild, t)!,
    );
  }

  static const MyColors light = MyColors(
    moreLightGray: Color(0xFFFDFDFF),
    lighterGray: Color(0xFFEDEDED),
    mainBlue: Color(0xFF247CFF),
    primaryColor: Color(0xFF202244),
    black: Color(0xFF0D0D0D),
    white: Color(0xFFFFFFFF),
    lightBlue: Color(0xFFE8F1FF),
    greyDark: Color(0xFF545454),
    blue: Color(0xFF0961F5),
    teal: Color(0xFF167F71),
    greyMedium: Color(0xFFA0A4AB),
    greyLight: Color(0xFFF5F9FF),
    blackSoft: Color(0xFF1D1D1B),
    greyish: Color(0xFFB4BDC4),
    greyLighter: Color(0xFFE2E6EA),
    greyDark2: Color(0xFF505050),
    orangeBright: Color(0xFFFF6B00),
    yellowGold: Color(0xFFFCCB40),
    orange: Color(0xFFFF9C07),
    yellowBright: Color(0xFFFAC025),
    blueLight: Color(0xFF004787),
    maroon: Color(0xFF472D2D),
    blueDark: Color(0xFF0455BF),
    yellowSoft: Color(0xFFEADDED),
    blueAccent: Color(0xFF1A6EFC),
    redBright: Color(0xFFDD2E44),
    greenBright: Color(0xFF50B748),
    yellowLight: Color(0xFFF3F3F3),
    greyDeep: Color(0xFF0F0F0F),
    greySteel: Color(0xFFD5E2F5),
    brown: Color(0xFF645033),
    greyMild: Color(0xFF8A8A8F),
  );

  static const MyColors dark = MyColors(
    moreLightGray: Color(0xFF0A0A0A),
    lighterGray: Color(0xFF101010),
    mainBlue: Color(0xFF135EEB),
    primaryColor: Color(0xFF1F1F1F),
    black: Color(0xFFFFFFFF),
    white: Color(0xFFEAEAEA),
    lightBlue: Color(0xFF263343),
    greyDark: Color(0xFFA8A8A8),
    blue: Color(0xFF68A5E8),
    teal: Color(0xFF2A8374),
    greyMedium: Color(0xFF636A73),
    greyLight: Color(0xFF1A1E27),
    blackSoft: Color(0xFF262625),
    greyish: Color(0xFFB0B8BF),
    greyLighter: Color(0xFF323539),
    greyDark2: Color(0xFF949494),
    orangeBright: Color(0xFFFF9100),
    yellowGold: Color(0xFFF0C419),
    orange: Color(0xFFFFA733),
    yellowBright: Color(0xFFE4AC12),
    blueLight: Color(0xFF173961),
    maroon: Color(0xFF6C4747),
    blueDark: Color(0xFF3B6AB8),
    yellowSoft: Color(0xFFD3C6CE),
    blueAccent: Color(0xFF337DFF),
    redBright: Color(0xFFCC3748),
    greenBright: Color(0xFF45A04C),
    yellowLight: Color(0xFFDADADA),
    greyDeep: Color(0xFF2E2E2E),
    greySteel: Color(0xFFBDC9DB),
    brown: Color(0xFF4D3A26),
    greyMild: Color(0xFF7E7E7E),
  );
}
