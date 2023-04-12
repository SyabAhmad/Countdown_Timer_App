import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _appHomePage createState() => _appHomePage();
}

class _appHomePage extends State<MyApp> {
  final _countLimit = TextEditingController();
  int _secondsRemaining = 0;
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {

          _stopTimer();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _countdown() {
    int countLimit = int.tryParse(_countLimit.text) ?? 0;
    if (countLimit > 0) {
      setState(() {
        _secondsRemaining = countLimit;
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Count Down APP",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Count Down Timer App"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                child: Text("e.g. make Count Down for 10 Seconds"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _countLimit,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                            "Time in sec",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _countdown,
                        child: Text("Start"),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                _secondsRemaining.toString(),
                style: TextStyle(fontSize: 72),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
