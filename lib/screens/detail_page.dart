import 'package:flutter/material.dart';

class Products{
  final String S_ID;
  final String SP_ID;
  final String Product_name;
  final String Image;
  final int Price;

  Products(this.S_ID, this.SP_ID, this.Product_name, this.Image, this.Price);
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<Products> productList = [
    Products("S001", "SP001", "+1본식] 스튜디오378+도화브라이드+살롱드뮤사이", "https://www.iwedding.co.kr/center/iweddingb/product/500_co_sl_i001_12875_1622620569_95027000_3232256100.jpg", 3165000),
    Products("S001", "SP001", "+2본식] 스튜디오378+도화브라이드+살롱드뮤사이", "https://www.iwedding.co.kr/center/iweddingb/product/500_co_sl_i001_12875_1622620569_95027000_3232256100.jpg", 3165000),
    Products("S001", "SP001", "+3본식] 스튜디오378+도화브라이드+살롱드뮤사이", "https://www.iwedding.co.kr/center/iweddingb/product/500_co_sl_i001_12875_1622620569_95027000_3232256100.jpg", 3165000)

  ];
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                    Text("마인스튜디오",style: TextStyle(
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
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Products",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 5),
                ),
                ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context,int index)=>ProductCard(context, index),
                  shrinkWrap: true,
                )

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget ProductCard(BuildContext context, int index){
    final Products = productList[index];
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Ink.image(
                image: NetworkImage(
                  Products.Image,
                ),
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 16,
                right: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Products.Product_name.length<=10?Products.Product_name:'${Products.Product_name.substring(0,10)}...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '\$${Products.Price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {

                        },
                        child: Text("Add to Cart"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




