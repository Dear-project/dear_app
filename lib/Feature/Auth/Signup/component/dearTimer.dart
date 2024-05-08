import 'dart:async';
import 'package:flutter/material.dart';

class DearTimer extends StatefulWidget {
  bool _isRunning;
  Timer _timer;

  DearTimer(this._isRunning, this._timer); // DearTimer(this._isRunning);

  @override
  State<DearTimer> createState() => _DearTimerState(_isRunning, _timer);
}

class _DearTimerState extends State<DearTimer> {
  int _seconds = 300;
  late Timer _timer;
  bool _isRunning;

  _DearTimerState(
      this._isRunning, this._timer); // _DearTimerState(this._isRunning);

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        }
      });
    });
  }

  void _stopTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _seconds = 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Text('${_seconds ~/ 60}:',
                  style: TextStyle(
                    height: 1.2,
                    fontFamily: "Pretendard",
                    color: Color(0xff0E2764),
                    fontSize: 15,
                  )),
              Text(
                '${(_seconds % 60)}'.padLeft(2, "0"),
                style: TextStyle(
                  height: 1.2,
                  fontFamily: "Pretendard",
                  color: Color(0xff0E2764),
                  fontSize: 15,
                ),
              ),

              // ElevatedButton(
              //   onPressed: _isRunning ? null : _startTimer,
              //   child: Text('Start'),
              // ),
              // SizedBox(width: 16),
              // ElevatedButton(
              //   onPressed: _isRunning ? _stopTimer : null,
              //   child: Text('Stop'),
              // ),
              // SizedBox(width: 16),
              // ElevatedButton(
              //   onPressed: _resetTimer,
              //   child: Text('Reset'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
