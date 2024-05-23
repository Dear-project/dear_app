import 'package:flutter/cupertino.dart';

class BannerViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BannerViewerState();
}

class _BannerViewerState extends State<BannerViewer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Expanded(
            child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xffE6E6E6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                )
            )

          ],
        )));
  }
}
