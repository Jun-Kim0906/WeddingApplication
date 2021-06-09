
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard {
  List<Widget> buildGridProduct(int count,bool isSelected, VoidCallback onHeartPressed){
    List<Container> products = List.generate(count, (index) => Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AspectRatio(
              aspectRatio: 35.0 / 11.0,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                        AssetImage('assets/bufferCardImg.jpeg'),
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.3),
                            BlendMode.lighten))),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(
                      fontFamily:
                      GoogleFonts.playfairDisplay().fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'SHOP NOW',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.workSans().fontFamily,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.0,),
                Container(
                  height: 1.3,
                  width: _textSize('SHOP NOW', TextStyle(
                    fontFamily:
                    GoogleFonts.workSans().fontFamily,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )).width+8.0,
                  color: Colors.black,
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              splashRadius: 1.0,
              color: isSelected?Colors.red:Colors.black,
              onPressed:onHeartPressed,
              icon: Icon(
                isSelected?Icons.favorite:Icons.favorite_border,
              ),
            ),
          )
        ],
      ),
    ));
    return products;
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}