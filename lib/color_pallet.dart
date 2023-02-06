import 'package:flutter/material.dart';

import 'imageColorGenerator.dart';

class ColorPalletPage extends StatefulWidget {
  const ColorPalletPage({Key? key}) : super(key: key);

  @override
  State<ColorPalletPage> createState() => _ColorPalletPageState();
}

class _ColorPalletPageState extends State<ColorPalletPage> {
  @override
  Widget build(BuildContext context) {
    final imageList = [
      'https://imageio.forbes.com/specials-images/imageserve/6170e01f8d7639b95a7f2eeb/Sotheby-s-NFT-Natively-Digital-1-2-sale-Bored-Ape-Yacht-Club--8817-by-Yuga-Labs/0x0.png?format=png&width=960'
          'https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/advisor/in/wp-content/uploads/2022/03/monkey-g412399084_1280.jpg'
    ];

    return ImageColorGenerator(
      image: NetworkImage(imageList[0]),
      imageSize: const Size(250, 150),
    );
  }
}
