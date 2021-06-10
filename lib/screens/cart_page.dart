import 'package:flutter/material.dart';
import 'test/crypto_data.dart';




class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // 1) 데이터를 여기서 불러오면 됍니다.
  var cryptoData = CryptoData.getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Cart',
                style: TextStyle(color: Colors.black),
              )

          ),


        // 2) Row쪽에 보시면 따로 위젯을 만들어놨습니다. 이 부분에서 Product를 넣어주면 될것 같습니다.

        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
// scrollDirection: Axis.horizontal,
                    itemCount: cryptoData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: 220,
                        width: double.maxFinite,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 2.0,
                                    //color: cryptoData[index]['iconColor']
                                    color: Theme.of(context).colorScheme.primary
                                ),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Stack(children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Stack(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  //cryptoIcon(cryptoData[index]),
                                                  SizedBox(height: 10, width: 10,),
                                                  cryptoNameSymbol(cryptoData[index]),
                                                  // Spacer(),
                                                  // cryptoChange(cryptoData[index]),
                                                  // SizedBox(width: 10,),
                                                  // changeIcon(cryptoData[index]),
                                                  // SizedBox(width: 20,)
                                                ],
                                              ),

                                              SizedBox(height: 13,),

                                              Row(
                                                children: <Widget>[
                                                  Image.network(
                                                      "http://img.marieclairekorea.com/2020/07/mck_5f22549fe9977.jpg"
                                                      // ,height:
                                                      ,width: 180),
                                                  cryptoAmount(cryptoData[index])
                                                ],
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      );
                    }),
              ),



            ],
          ),
        )
    );
  }
    //);

    // Widget cryptoIcon(data) {
    //   return Padding(
    //     padding: const EdgeInsets.only(left: 15.0),
    //     child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: Icon(
    //           data['icon'],
    //           color: data['iconColor'],
    //           size: 40,
    //         )),
    //   );
    // }

    Widget cryptoNameSymbol(data) {
      return Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            // 매장이름(?)
            text: '${data['name']}',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            children: <TextSpan>[
              // 상품명(?)으로 바꿔주면 좋을 것 같습니다!
              TextSpan(
                  text: '\n${data['symbol']}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    }

    Widget cryptoChange(data) {
      return Align(
        alignment: Alignment.topRight,
        child: RichText(
          text: TextSpan(
            text: '${data['change']}',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                  text: '\n${data['changeValue']}',
                  style: TextStyle(
                      color: data['changeColor'],
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    }
    Widget changeIcon(data) {
      return Align(
          alignment: Alignment.topRight,
          child: data['change'].contains('-')
          ? Icon(
        Icons.arrow_back_ios,
            //Typicons.arrow_sorted_down,
        color: data['changeColor'],
        size: 30,
      )
          : Icon(
            Icons.arrow_forward_ios,
        //Typicons.arrow_sorted_up,
        color: data['changeColor'],
        size: 30,
      ));
    }

    Widget cryptoAmount(data) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  // 가격 정보를 기입하면 될 것 같습니다.
                  text: '\n${data['value']}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 35,
                  ),

                  // children: <TextSpan>[
                  //   TextSpan(
                  //       text: '\n0.1349',
                  //       style: TextStyle(
                  //           color: Colors.grey,
                  //           fontStyle: FontStyle.italic,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold)),
                  // ],

                ),
              ),
            ],
          ),
        ),
      );
    }












    // 되는거
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   appBar: AppBar(
    //       centerTitle: true,
    //       leading: IconButton(
    //         icon: Icon(Icons.arrow_back),
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //       ),
    //       title: const Text(
    //         'Cart',
    //         style: TextStyle(color: Colors.black),
    //       )
    //
    //   ),
    //   body: Container(
    //     padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    //     height: 220,
    //     width: double.maxFinite,
    //     child: Card(
    //       elevation: 5,
    //       child:Padding(
    //         padding: EdgeInsets.all(7),
    //     child: Stack(
    //         children: <Widget>[
    //           Align(
    //             alignment: Alignment.centerRight,
    //             child: Stack(
    //               children: <Widget>[
    //                 Padding(
    //                     padding: const EdgeInsets.only(left: 10, top: 5),
    //                     child: Column(
    //                       children: <Widget>[
    //                         Row(
    //                           children: <Widget>[
    //                             Padding(
    //                               padding: const EdgeInsets.only(left: 15.0),
    //                               child: Align(
    //                                   alignment: Alignment.centerLeft,
    //                                   child: Icon(
    //                                     Icons.star,
    //                                     color: Colors.amber,
    //                                     size: 40,
    //                                   )),
    //                             )
    //                           ],
    //                         )
    //                       ],
    //                     ))
    //               ],
    //             ),
    //           )
    //         ]),
    //   ),
    //
    //
    //
    //     ),
    //   )
    //
    //
    // );
  //}
}
