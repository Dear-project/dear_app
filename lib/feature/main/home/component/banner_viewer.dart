import 'dart:async';

import 'package:flutter/material.dart';

class BannerViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BannerViewerState();

  PageController _pageController = PageController(initialPage: 0);
  int _activeIndex = 0;
  Timer? _timer;

}

class _BannerViewerState extends State<BannerViewer> {
  int count = 5;

  void startTimer() {
    widget._timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if(widget._pageController.page == count - 1) {
        widget._pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
      else {
        widget._pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
      }
    });

  }

  @override
  void initState() {
    super.initState();
    startTimer();
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
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: widget._pageController,
                onPageChanged: (value) {
                  setState(() {
                    widget._activeIndex = value;
                  });

                },
                children: [
                  ...List.generate(
                      count,
                          (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffE6E6E6),
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ))
                ],
              )),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      count,
                          (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: InkWell(
                            onTap: () {
                              widget._pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
                            },
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == widget._activeIndex ? Color(0xff0E2764) : Color(0xffD5DCEC)),
                            ),
                          )
                      ))
                ],
              ))
        ],
      )
    );
  }
}
