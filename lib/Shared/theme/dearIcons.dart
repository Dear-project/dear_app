import 'package:flutter/material.dart';

class DearIcons {
  static Image home = Image.asset("assets/icons/home.png");
  static Image chat = Image.asset("assets/icons/chat.png");
  static Image inventory = Image.asset("assets/icons/inventory.png");
  static Image people = Image.asset("assets/icons/people.png");
  static Image my = Image.asset("assets/icons/my.png");
  static Image bell = Image.asset("assets/icons/bell.png");
  static Image back = Image.asset("assets/icons/back.png");
  static Image detail = Image.asset("assets/icons/detail.png");
  static Image attach = Image.asset("assets/icons/attach.png");
  static Image photo = Image.asset("assets/icons/photo.png");
  static Image send = Image.asset("assets/icons/send.png");
  static Image check = Image.asset("assets/icons/check.png");
  static Image dropdown = Image.asset("assets/icons/dropdown.png");
  static Image book = Image.asset("assets/icons/book.png");
  static Image banner = Image.asset("assets/icons/banner.png");
}

extension DearIconsFill on Image {

  Image toFill(bool fill) {

    if (fill == true) {
      var str = this.toString();
      var substr = str.substring(str.lastIndexOf("(") + 1, str.indexOf(")"));
      var path = substr.substring(substr.lastIndexOf(" ") + 1, substr.lastIndexOf(".")).replaceAll("\"", "");

      var image;

      try {
        image = Image.asset("${path}_fill.png");
      }
      catch(e) {
        image = Image(
          image: this.image,
          color: Color(0xff0E2764)
        );
      }

      return image;
    }
    else {
      return this;
    }
  }
}

