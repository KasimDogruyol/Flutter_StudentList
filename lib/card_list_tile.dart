import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget{
  const CardListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card List Tile'),
      ),
      body: Center(
        child: ListView(
          // reverse: true, //Listeyi ters çevirir
          children: [
            Column(
              children: [
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
              ],
            ),
            Text("Single Child Scroll View"),
            ElevatedButton(onPressed: (){}, child: Text("Elevated Button")),
            
          ],
        ),
        )
       
      
      
    );
  }

  SingleChildScrollView singleChildKullanimi() {
    return SingleChildScrollView(
        child: Column(
          children: [
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
            tekListeElemani(),
          ],
        ),
      );
  }

  Column tekListeElemani() {
    return Column(
        children: [
          Card(
            color: Colors.blue.shade100,
            shadowColor: Colors.red,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: const Icon(Icons.account_circle), //sola başa koyulan
              title: const Text('Kullanıcı Adı'), //Başlık
              subtitle: const Text('Kullanıcı Açıklaması'), //Alt Başlık
              trailing: const Icon(Icons.arrow_forward_ios), //Sağa sona koyulan
            ),
            ),
            Divider( //Divider ile aralara çizgi koyabiliriz bölücü
              color: Colors.red,
              height: 50, // yukarıdan olan boşluk
              thickness: 5,//çizginin kalınlığı
              indent: 20, //soldan olan boşluk
              endIndent: 30, //sağdan olan boşluk
            ),
        ],
      );
  }
}