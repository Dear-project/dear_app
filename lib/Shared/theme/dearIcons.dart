import 'package:flutter/material.dart';

class DearIcons {
  static Image home = Image.asset("assets/icons/home.png");
  static Image chat = Image.asset("assets/icons/chat.png");
  static Image inventory = Image.asset("assets/icons/inventory.png");
  static Image people = Image.asset("assets/icons/people.png");
  static Image my = Image.asset("assets/icons/my.png");
}

extension DearIconsFill on Image {

  Image toFill(bool fill) {

    if (fill == true) {
      var str = this.toString();
      var substr = str.substring(str.lastIndexOf("(") + 1, str.indexOf(")"));
      var path = substr.substring(substr.lastIndexOf(" ") + 1, substr.lastIndexOf(".")).replaceAll("\"", "");
      
      return Image.asset("${path}_fill.png");
    }
    else {
      return this;
    }
  }
}

