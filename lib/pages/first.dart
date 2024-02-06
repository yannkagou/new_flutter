import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class FirstPage extends StatefulWidget {
  final String? name;
  const FirstPage({Key? key, this.name}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String enteredPin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page, hello, ${widget.name}")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/Rectangle.png', // Replace with your image path
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.0),
              PinCodeTextField(
                autoFocus: true,
                appContext: context,
                length: 6,
                onChanged: (value) {
                  setState(() {
                    enteredPin = value;
                  });
                },
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Entered PIN: $enteredPin',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ElevatedButton(
                onPressed: () {
                  // Perform an action when the button is pressed
                  print('Button Pressed');
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
