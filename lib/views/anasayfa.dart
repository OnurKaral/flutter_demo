import 'package:flutter/material.dart';
import 'package:flutter_person/entity/kisiler.dart';
import 'package:flutter_person/views/kisi_detay_sayfa.dart';
import 'package:flutter_person/views/kisi_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                decoration: const InputDecoration(
                    hintText: "Ara", fillColor: Colors.white, filled: true),
                onChanged: (aramaSonucu) {
                  print("Arama sonucu : $aramaSonucu");
                },
              )
            : const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  var kisi =
                      Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KisiDetaySayfa(kisi: kisi)));
                },
                child: const Text("Detay")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Kişi Kayıt"),
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const KisiKayitSayfa()));
        },
      ),
    );
  }
}
