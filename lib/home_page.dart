import 'dart:math';

import 'package:flutter/material.dart';
import 'package:optandcolor_generator/color_pallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var random = new Random();
  int otpNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Generate OPT",
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Random OTP: $otpNumber",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  otpNumber = generate6digitOtp();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber, // background
                  onPrimary: Colors.white,
                ),
                child: const Text("Generate Random OTP")),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ColorPalletPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade400, // background
                  onPrimary: Colors.white,
                ),
                child: const Text("Visit Color Palet generator"))
          ],
        ),
      ),
    );
  }

  int generate6digitOtp() {
    var rand = new Random();

    int sixdigit = rand.nextInt(666666) + 100000;
    return sixdigit;
  }
}
