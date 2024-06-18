import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BannerViewerState();
}

class _BannerViewerState extends State<BannerViewer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            ...List.generate(100, (index) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16)
                ),
              ),
            ))

          ],
        )
    );
  }
}
