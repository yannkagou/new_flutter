import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_flutter/pages/first.dart';
import 'package:new_flutter/pages/second.dart';
import 'package:new_flutter/splashscreen.dart';

// Riverpod has multiple providers

// 1- Provider: It's a read only value

final nameProvider = Provider((ref) {
  return 'Yannick';
});

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashScreen(),
        "/message": (context) => const Message(),
        "/first": (context) => const FirstPage(),
        "/second": (context) => const SecondPage(),
      },
    );
  }
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting Yannick"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(("I'm a snckbar"))));
                  },
                  child: const Text("Snackbar")),
              TextButton(
                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const FirstPage()));
                  // },

                  // onPressed: () {
                  //   Navigator.of(context).pushNamed("/first");
                  // },

                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const FirstPage(name: "Yannick")));
                  },
                  child: const Text("First page")),
              TextButton(
                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const SecondPage()));
                  // },

                  // onPressed: () {
                  //   Navigator.pushNamed(context, "/second");
                  // },
                  onPressed: () {
                    Navigator.pushNamed(context, "/second", arguments: "Berty");
                  },
                  child: const Text("Second page")),
            ],
          ),
        ),
      ),
    );
  }
}
