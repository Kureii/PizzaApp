import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Style {
  late Color primary;
  late Color secundary;
  late Color highlight;
  late Color white;
  late Color black;
  late Color err;
  late Color transparent;
  late TextStyle h1;
  late TextStyle h2;
  late TextStyle h3;
  late TextStyle h4;
  late TextStyle label;
  late TextStyle btnText;
  late TextStyle invBtnText;
  late Widget showPswd;
  late Widget hidePswd;
  late OutlineInputBorder unfocused;
  late OutlineInputBorder focused;
  late OutlineInputBorder errUnfocused;
  late OutlineInputBorder errfocused;


  Style() {
    primary = const Color(0xFF307906);
    highlight = const Color(0xFF5BC41D);
    secundary = const Color(0xFF760678);
    white = const Color(0xFFFFFFFF);
    black = const Color(0xFF201E1B);
    err = const Color(0xFF830020);
    transparent = const Color.fromARGB(0, 0, 0, 0);

    h1 = TextStyle(fontSize: 42, fontWeight: FontWeight.w700, color: black);
    h2 = TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: black);
    h3 = TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: black);
    h4 = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: black);
    label =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: black);
    btnText = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: white);
    invBtnText = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: black);
    showPswd = SvgPicture.asset(
      'lib/assets/icons/ShowPsw.svg',
      color: black,
      semanticsLabel: "Ukázat heslo",
      );
    hidePswd = SvgPicture.asset(
      'lib/assets/icons/HidePsw.svg',
      color: black,
      semanticsLabel: "Skrýt heslo",
    );
    unfocused = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
      color: transparent,
      width: 2,
      )
    );
    focused = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: primary,
          width: 2,
        )
    );
    errUnfocused = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: err,
        width: 2,
      ),
    );
    errfocused = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: err.withOpacity(.5),
        width: 2,
      ),
    );
  }

  ButtonStyle btnStyle (double radius) => ElevatedButton.styleFrom(
    onPrimary: Color.lerp(primary, black, 0.35),
    primary: primary,
    onSurface: primary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius)
    ),
  );
  ButtonStyle invBtnStyle(double radius) => ElevatedButton.styleFrom(
    onPrimary: Color.lerp(white, black, 0.25),
    primary: white,
    onSurface: primary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius)
    ),
  );
  ButtonStyle dateBtn(double radius) => ElevatedButton.styleFrom(
    onPrimary: const Color.fromARGB(255, 163, 147, 44),
    primary: const Color.fromARGB(255, 44, 163, 60),
    onSurface: const Color.fromARGB(255, 44, 153, 163),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius)
    ),
  );
}

