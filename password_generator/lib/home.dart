import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:password_generator/list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var password = "Press the button";

  press() {
    final upper_index = Random().nextInt(23);
    final lower_index = Random().nextInt(23);
    final symbol_index = Random().nextInt(15);
    final number_index = Random().nextInt(10);
    final lower_index2 = Random().nextInt(23);
    final number_index2 = Random().nextInt(10);

    String generated = upperCases[upper_index] +
        numbers[number_index].toString() +
        lowerCases[lower_index] +
        symbols[symbol_index] +
        lowerCases[lower_index2] +
        numbers[number_index2].toString();

    setState(() {
      password = generated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Password Generator",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 31,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange, Colors.red])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Password",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red,
                            offset: Offset(4, 4),
                            blurRadius: 2)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(password.toString(),
                        style: GoogleFonts.poppins(fontSize: 27)),
                  )),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: press,
                child: Text(
                  "Generate",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                minWidth: 200,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
