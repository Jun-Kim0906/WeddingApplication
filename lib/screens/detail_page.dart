import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.55,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wedding/wedding1.webp'),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Title",style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold
                    ),),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 30,
                        ),
                        Text("4",style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),

                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("DESCRIPTION",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 5),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("description",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )
              ],
            ),
          )


        ],
      ),
    );
  }
}
