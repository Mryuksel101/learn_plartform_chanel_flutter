
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:AnaEkran(),
    );
  }
}


class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  var _batteryLevel;
  static const platform = MethodChannel('batarya'); // Get battery level.

  void _getBatteryLevel() async {
    debugPrint("deneme");
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      setState(() {
        _batteryLevel = result;
      });
      debugPrint(result.toString());

    } catch (e) {
      debugPrint(e.toString());
      debugPrint("kaç");
    }

    debugPrint("deneme2");

  }

  

  
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar:AppBar(
        title: Text("$_batteryLevel"),
      ),

      body: Center(
        child: TextButton(
          onPressed: () {
            _getBatteryLevel();

          }, 
          child: const Text("bas")
        )
      ),
    );
  }
}