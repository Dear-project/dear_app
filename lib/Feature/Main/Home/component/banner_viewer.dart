import 'dart:async';

import 'package:dear_app/Feature/Main/Home/model/banner_response.dart';
import 'package:dear_app/Shared/theme/dear_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BannerViewer extends StatefulWidget {
  List<BannerResponse> list;

  BannerViewer({required this.list, super.key});

  @override
  State<StatefulWidget> createState() => _BannerViewerState();

  PageController _pageController = PageController(initialPage: 0);
  int _activeIndex = 0;
  Timer? _timer;
}

class _BannerViewerState extends State<BannerViewer> {
  void startTimer() {
    widget._timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (widget._pageController.page == widget.list.length - 1) {
        widget._pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        widget._pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.linear);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.list.length > 1) {
      startTimer();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    widget._timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            SizedBox(
                height: 152,
                child:  PageView(
                  scrollDirection: Axis.horizontal,
                  controller: widget._pageController,
                  onPageChanged: (value) {
                    setState(() {
                      widget._activeIndex = value;
                    });
                  },
                  children: [
                    ...List.generate(
                        widget.list.length,
                            (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if(widget.list[index].url != null) {
                                  launchUrlString(widget.list[index].url!);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: widget.list[index].imgPath != null
                                          ? NetworkImage(
                                          widget.list[index].imgPath!)
                                          : DearImages.bannerPlaceholder.image
                                  ),
                                ),
                              ),
                            )))
                  ],
                )),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        widget.list.length,
                            (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: InkWell(
                              onTap: () {
                                widget._pageController.animateToPage(index,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == widget._activeIndex
                                        ? Color(0xff0E2764)
                                        : Color(0xffD5DCEC)),
                              ),
                            )))
                  ],
                ))
          ],
        ));
  }
}