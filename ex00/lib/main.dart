import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulamam());
}

class Uygulamam extends StatelessWidget {
  const Uygulamam({super.key});

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
                "Slmalkm Dunya Anasayfa",
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
