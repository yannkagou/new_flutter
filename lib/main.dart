import 'package:flutter/material.dart';
import 'package:new_flutter/carouseldots.dart';
import 'package:new_flutter/pages/authscreen.dart';
import 'package:new_flutter/pages/first.dart';
import 'package:new_flutter/pages/second.dart';
import 'package:new_flutter/splashscreen.dart';
import 'package:new_flutter/widgets/numeric_keybad.dart';

import 'dart:async';

import 'package:pin_code_fields/pin_code_fields.dart';

void main() {
  runApp(const MyApp());
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
        "/code": (context) => UnderscoreCodeInput(),
        "/auth": (context) => const AuthScreen(),
        "/message": (context) => const Message(),
        "/first": (context) => const FirstPage(),
        "/second": (context) => const SecondPage(),
        "/home": (context) => const Home(),
        "/dot": (context) => const Carouseldots(),
      },
    );
  }
}

class UnderscoreCodeInput extends StatefulWidget {
  @override
  _UnderscoreCodeInputState createState() => _UnderscoreCodeInputState();
}

class _UnderscoreCodeInputState extends State<UnderscoreCodeInput> {
  String enteredPin = '';

  void handlePinCodeChanges(String value) {
    setState(() {
      enteredPin = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: PinCodeTextField(
            appContext: context,
            length: 4,
            onChanged: handlePinCodeChanges,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              inactiveColor: Colors.grey,
              activeColor: Colors.black,
              selectedColor: Colors.black,
            ),
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Entered Pin Code: $enteredPin',
          style: TextStyle(fontSize: 16),
        ),
      ],
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
              UnderscoreCodeInput(),
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
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/demo");
                  },
                  child: const Text("Demo Input")),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/auth");
                  },
                  child: const Text("Auth")),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  child: const Text("Home")),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/dot");
                  },
                  child: const Text("Carousel")),
            ],
          ),
        ),
      ),
    );
  }
}

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting Yannick"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network("https://picsum.photos/200/200"),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Notifications  "),
                Switch(
                    value: value,
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue;
                      });
                    }),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: textController,
              keyboardType: TextInputType.none,
            ),
            const Spacer(),
            NumericKeypad(
              controller: textController,
            ),
          ],
        ),
      ),
    );
  }
}
