import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulamam());
}


class Uygulamam extends StatefulWidget {
  const Uygulamam({super.key});

  @override
  State<Uygulamam> createState() => _UygulamamState();
}

class _UygulamamState extends State<Uygulamam> {
  String metin = "Slmalkm Dunya Anasayfa";
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Roboto"),
      home: Scaffold(
        backgroundColor: Colors.limeAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                metin,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.00,
                ),
              ),
              Image.asset('assets/img/image.png', width: 300),
              ElevatedButton(
                onPressed: () => print('Button pressed'),
                onLongPress: () => print('sakin ol bro basılı tutma!'),
                child: Text(
                  "Bana tıkla",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isChanged) {
                      metin = "Slmalkm Dunya Anasayfa";
                      isChanged = false;
                    } else {
                      metin = "Metin Değiştirildi!";
                      isChanged = true;
                    }
                  });
                },
                child: Text(
                  "Change Text",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "App Bar Tittle",
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 30, 82),
        ),
      ),
    );
  }
}