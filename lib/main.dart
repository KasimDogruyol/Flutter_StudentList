import 'package:flutter/material.dart';
import 'package:listeturuveolusturma/listview_kullanimi.dart';
import 'card_list_tile.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
void main() {
  runApp(const MyApp());
  configLoading();

}
void configLoading(){
  EasyLoading.instance
  ..displayDuration = const Duration(milliseconds: 2000)
  ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  ..loadingStyle = EasyLoadingStyle.custom
  ..indicatorSize = 45.0
  ..radius = 10.0
  ..progressColor = Colors.yellow
  ..backgroundColor = Colors.green
  ..indicatorColor = Colors.yellow
  ..textColor = Colors.white
  ..maskColor = Colors.blue.withOpacity(0.5)
  ..userInteractions = true
  ..dismissOnTap = false;

}

//Listeler için  cardlist divider
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewKulanimi(),
      builder: EasyLoading.init(),
    );
  }
}