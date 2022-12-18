import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewKulanimi extends StatelessWidget{
   ListViewKulanimi({Key? key}) : super(key: key);

  List<Ogrenci> tumOgrenciler = List.generate(500, (index) => Ogrenci(index+1, 'Ogrenci adı ${index +1}', 'Ogrenci soyadı ${index +1}'));

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Kullanımı'),
      ),
      body:ListView.separated(itemBuilder: (context, index){
        var oankiOgrenci = tumOgrenciler[index];
        return Card(
          color: index % 2 == 0 ? Colors.red : Colors.blue,
          child: ListTile(
            onTap: () {
              if (index % 2 == 0){
                EasyLoading.instance.backgroundColor= Colors.red;
                EasyLoading.instance.textColor = Colors.black;
              }else{
                EasyLoading.instance.backgroundColor = Colors.blue;
              }
              EasyLoading.showToast('Tıklandı...',duration: const Duration(seconds: 2),
              dismissOnTap:true,
              toastPosition: EasyLoadingToastPosition.bottom,
              );
            },
            onLongPress: (){
              _alertDialogGoster(context, oankiOgrenci);
            } ,
            title: Text(oankiOgrenci.ad),
            subtitle: Text(oankiOgrenci.soyad),
            leading: CircleAvatar(
              child: Text (oankiOgrenci.id.toString()),
            ),
            trailing: Icon(Icons.add),
          ),
        );
      },itemCount: tumOgrenciler.length,
      separatorBuilder: (context, index) {
        var yeniIndex = index + 1;
        if (yeniIndex % 4 == 0 ) {
          return Divider(
          thickness: 2,
          color: Colors.black,
          height: 2,
          indent: 20,
          endIndent: 20,
        );
        }
        return SizedBox();
        
      },
      ),
      
      );

    
  }
  void _alertDialogGoster(BuildContext myContext,Ogrenci ogr){
    //context ben bu wigetin neresinde olduğumu gösterir veya neyden sonra geldiğimi gösterir
    showDialog(context: myContext, builder: (context){
      return AlertDialog(
        title: Text(ogr.ad + " " + ogr.soyad.toString()),
        content: SingleChildScrollView(
          child: ListBody(children: [
            Text("Uzun Basıldığında Ekrana Çıkar",
            style: TextStyle(fontSize: 24, color: Colors.red),
            ),
          ],),
        ),
        actions: [
          ButtonBar(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context); // o an açık olan ekrandan bi önceki ekrana git
              }, child: Text('Tamam')),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('İptal')),
            ],
          )
        ],
      );
    });
  }

  ListView classicviewlist() {
    return ListView(
      children: tumOgrenciler.map((Ogrenci ogr) =>ListTile(
        title: Text(ogr.ad),
        subtitle: Text(ogr.soyad),
        leading: CircleAvatar(
          child: Text(ogr.id.toString()),
        ),
        trailing: Icon(Icons.add),
      )).toList(),
    );
  }
}

class Ogrenci {
  final int id;
  final String ad;
  final String soyad;

  Ogrenci(this.id, this.ad, this.soyad);
  @override
  String toString() {
    return 'Ogrenci{id: $id, ad: $ad, soyad: $soyad}';
  }
}