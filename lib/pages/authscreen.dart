import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Rectangle.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Image(image: AssetImage("assets/Rectangle.png")),
          Text(
              "Avec FindMe, obtenez votre plan de localisation postal certifiee"),
          ElevatedButton(
            child: Text(
              "Je cree mon espace",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.green, elevation: 0, shape: StadiumBorder()),
            onPressed: () {},
          ),
          ElevatedButton(
            child: Text(
              "Je me connecte",
              style: TextStyle(color: Colors.green),
            ),
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 1, color: Colors.green),
                primary: Colors.white,
                elevation: 0,
                shape: StadiumBorder()),
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
