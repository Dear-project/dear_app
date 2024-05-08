import 'package:flutter/cupertino.dart';

class ChatCell extends StatelessWidget {

  void _handleHorizontalDarg() {
    print('Long press gesture detected!');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onLongPress: _handleHorizontalDarg,
      // onHorizontalDragStart: _handleHorizontalDarg,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          height: 50,
          child: Row(
            children: [
              Spacer(flex: 1),
              Transform.scale(
                scale: 2.3,
                child: Icon(
                  CupertinoIcons.person_crop_circle_fill,
                  color: Color(0xffD1D1D1),
                ),
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "이해준",
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "영남이공대학 박승철 헤어과",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 11,
                          color: Color(0xffAAAAAA),
                        ),
                      ),
                      SizedBox(width: 80),
                      Text(
                        "어제",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff787878),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.only(right: 250),
                    child: Text(
                      "하이",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 15,
                        color: Color(0xff787878),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
