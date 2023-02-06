import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ImageColorGenerator extends StatefulWidget {
  const ImageColorGenerator(
      {Key? key, required this.image, required this.imageSize})
      : super(key: key);

  final ImageProvider image;
  final Size imageSize;

  @override
  State<ImageColorGenerator> createState() => _ImageColorGeneratorState();
}

class _ImageColorGeneratorState extends State<ImageColorGenerator> {
  PaletteGenerator? paletteGenerator;
  Color defaultColor = Colors.black;

  void generateColors() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(widget.image,
        size: widget.imageSize,
        region: Rect.fromLTRB(
            0, 0, widget.imageSize.width, widget.imageSize.height));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: (Text('Color Pallet Generator')),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Please Tap the image below to Generate Color ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    backgroundColor: Colors.grey.shade300),
              ),
            ),
            InkWell(
              onTap: () {
                generateColors();
              },
              child: Image(
                image: widget.image,
                width: widget.imageSize.width,
                height: widget.imageSize.height,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Generated Color Palette ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  backgroundColor: Colors.red.shade500),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: paletteGenerator != null
                        ? paletteGenerator!.vibrantColor != null
                            ? paletteGenerator!.vibrantColor!.color
                            : defaultColor
                        : defaultColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: paletteGenerator != null
                        ? paletteGenerator!.lightMutedColor != null
                            ? paletteGenerator!.lightMutedColor!.color
                            : defaultColor
                        : defaultColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: paletteGenerator != null
                        ? paletteGenerator!.darkMutedColor != null
                            ? paletteGenerator!.darkMutedColor!.color
                            : defaultColor
                        : defaultColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: paletteGenerator != null
                        ? paletteGenerator!.lightVibrantColor != null
                            ? paletteGenerator!.lightVibrantColor!.color
                            : defaultColor
                        : defaultColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
