import 'package:flutter/material.dart';

enum DearIcons {
  home(path: "assets/icons/home.png"),
  chat(path: "assets/icons/chat.png"),
  communityChat(path: "assets/icons/community_chat.png"),
  communityProfile(path: "assets/icons/community_profile.png"),
  inventory(path: "assets/icons/inventory.png"),
  people(path: "assets/icons/people.png"),
  my(path: "assets/icons/my.png"),
  bell(path: "assets/icons/bell.png"),
  back(path: "assets/icons/back.png"),
  next(path: "assets/icons/next.png"),
  detailVertical(path: "assets/icons/detail.png"),
  attach(path: "assets/icons/attach.png"),
  photo(path: "assets/icons/photo.png"),
  send(path: "assets/icons/send.png"),
  check(path: "assets/icons/check.png"),
  dropdown(path: "assets/icons/dropdown.png"),
  book(path: "assets/icons/book.png"),
  banner(path: "assets/icons/banner.png"),
  profile(path: "assets/icons/profile.png"),
  detailHorizontal(path: "assets/icons/detail_horizontal.png"),
  arrowLeft(path: "assets/icons/left_arrow.png"),
  write(path: "assets/icons/write.png"),
  editProfile(path: "assets/icons/edit_profile.png"),
  calendar(path: "assets/icons/calendar.png"),
  meal(path: "assets/icons/meal.png");

  final String path;
  const DearIcons({required this.path});

}


extension DearIconsToIcon on DearIcons {
  Image toIcon({bool fill = false}) {
    if (fill) {
      try {
        return Image.asset(path.replaceFirst(".", "_fill."));
      } catch (e) {
        return Image.asset(path);
      }
    } else {
      return Image.asset(path);
    }
  }
}
