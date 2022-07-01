// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tfControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Etkileşimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text("hello"),
                      action: SnackBarAction(
                          label: "OK",
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("deleted")));
                          }),
                    ),
                  );
                },
                child: const Text("snackbar(varsayılan)")),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "no internet connection",
                        style: TextStyle(color: Colors.indigoAccent),
                      ),
                      backgroundColor: Colors.white,
                      action: SnackBarAction(
                          label: "try again",
                          textColor: Colors.red,
                          onPressed: () {}),
                    ),
                  );
                },
                child: const Text("snackbar(özel)")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("baslık"),
                          content: Text("icerik"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("iptal")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("tamam")),
                          ],
                        );
                      });
                },
                child: const Text("alert(varsayılan)")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("kayıt islemi"),
                          content: TextField(
                            controller: tfControl,
                            decoration: const InputDecoration(hintText: "Veri"),
                          ),
                          backgroundColor: Colors.grey,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "iptal",
                                  style: TextStyle(color: Colors.white),
                                )),
                            TextButton(
                                onPressed: () {
                                  print("alınan veri: ${tfControl.text}");
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "kaydet",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        );
                      });
                },
                child: const Text("alert(özel)")),
          ],
        ),
      ),
    );
  }
}
