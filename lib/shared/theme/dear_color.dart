import 'dart:ui';

class DearColors {
  const DearColors._();

  static const Color main =  Color(0xff0E2764);
  static const Color white =  Color(0xffffffff);
  static _DearColorBlue blue = const _DearColorBlue._();
  static _DearColorRed red = const _DearColorRed._();
  static _DearColorBlack black = const _DearColorBlack._();

}


class _DearColorBlue {
  const _DearColorBlue._();

  final Color primary100 = const Color(0xff209DE4);
  final Color primary200 = const Color(0xff748CAB);
  final Color primary300 = const Color(0xff3E5C76);
  final Color primary400 = const Color(0xff1D2D44);
  final Color primary500 = const Color(0xff0D1321);
  final Color primary700 = const Color(0xffDEE4F0);
  final Color primary800 = const Color(0xffEBEFFF);
  final Color primary900 = const Color(0xff708FFF);
  final Color primary1000 = const Color(0xffC5D0DA);

}

class _DearColorRed {
  const _DearColorRed._();

  final Color red100 = const Color(0xffC1121F);
  final Color red200 = const Color(0xff780000);
  final Color red300 = const Color(0xffF90707);
  final Color red400 = const Color(0xffEA0C0C);

}

class _DearColorBlack {
  const _DearColorBlack._();

  final Color black100 = const Color(0xffF7F8FA);
  final Color black200 = const Color(0xffE8EAED);
  final Color black300 = const Color(0xffC3C4C7);
  final Color black400 = const Color(0xff7B7B7B);
  final Color black500 = const Color(0xff484848);
  final Color black600 = const Color(0xff1D1D1D);
}