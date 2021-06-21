import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wedding_test/models/store/store_model.dart';

class ProductCard {
  List<Widget> buildGridProduct(
      {List<Store> stores, Function(Store) onPressed}) {
    return stores.map((store){
      return Container(
        child: GestureDetector(
          onTap: ()=> onPressed(store),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AspectRatio(
                  aspectRatio: 35.0 / 11.0,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: store.imgUrl==''?AssetImage('assets/bufferCardImg.jpeg'):NetworkImage(store.imgUrl),
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.darken))),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      store.name,
                      style: TextStyle(
                          fontFamily:
                          GoogleFonts.playfairDisplay().fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'SHOP NOW',
                      style: TextStyle(
                        fontFamily: GoogleFonts.workSans().fontFamily,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      height: 1.3,
                      width: _textSize(
                          'SHOP NOW',
                          TextStyle(
                            fontFamily:
                            GoogleFonts.workSans().fontFamily,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          )).width +
                          8.0,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
