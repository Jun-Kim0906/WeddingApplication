import 'package:flutter/material.dart';
import 'test/crypto_data.dart';

class ScrapPage extends StatefulWidget {
  const ScrapPage({Key key}) : super(key: key);

  @override
  _ScrapPageState createState() => _ScrapPageState();
}

class _ScrapPageState extends State<ScrapPage> {

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
              'Scrap',
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
                    itemCount: cryptoData.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction){
                          setState(() {
                            cryptoData.removeAt(index);
                          });
                        },
                        background: Container(color: Colors.red),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 220,
                          width: double.maxFinite,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            elevation: 5,
                            child: Container(
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
                                                    SizedBox(height: 10, width: 10,),
                                                    cryptoNameSymbol(cryptoData[index]),
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
                        ),
                      );
                    }),
              ),
         ]
        )
    ),
    );
  }
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
