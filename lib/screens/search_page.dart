import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

var db =Mysql();
List<String> storelist =[];
List<int> ratinglist =[];
List<String> desclist = [];

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFormField(

        )
      ],
    );
  }
}

class searchBar extends StatefulWidget {
  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  getAllStore()async{
    db.getConnection().then((conn){
      String sql = 'select storename from Data.minseoktest;';
      conn.query(sql).then((result){
        for(var row in result){
          storelist.add(row[0]);
        }
      });
    });
    return storelist;
  }
  @override
  void initState(){
    super.initState();
    getAllStore();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: 'Search...'
        ),
        onTap: ()async{
          final result = await showSearch(context: context, delegate: searchitem(storelist));
          print(result);
        },
      ),
    );
  }
}

class searchitem extends SearchDelegate<String>{
  final List<String> storelist;
  String result;
  searchitem(this.storelist);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon:Icon(Icons.clear), onPressed: (){
        query="";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
      onPressed: (){
        close(context, result);
      },
      icon: Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = storelist.where((name){
      return name.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(suggestions.elementAt(index)),
          onTap: (){
            result = suggestions.elementAt(index);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = storelist.where((name){
      return name.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(suggestions.elementAt(index)),
          onTap: (){
            query = suggestions.elementAt(index);
          },
        );
      },
    );
  }
}


class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  getAllStore()async{
    db.getConnection().then((conn){
      String sql = 'select storename from Data.ttt order by rating desc limit 10;';
      conn.query(sql).then((result){
        for(var row in result){
          storelist.add(row[0]);
        }
      });
    });
    return storelist;
  }
  @override
  void initState(){
    super.initState();
    getAllStore();
  }



  // Description List Here
  var descList = [
    "Push yourself, because no one else is going to do it for you.",
    "Your limitation—it's only your imagination.",
    "Hard Work changes the life.",
    "Sometimes it's the smallest decisions that can change your life forever.",
    "Confidence is the most beautiful thing you can possess",
    "A big business starts small.",
  ];

  // Image Name List Here
  var imgList = [
    "assets/logo/logo_transparent.png",
    "assets/logo/logo_transparent.png",
    "assets/logo/logo_transparent.png",
    "assets/logo/logo_transparent.png",
    "assets/logo/logo_transparent.png",
    "assets/logo/logo_transparent.png",
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return ListView.builder(
        itemCount: storelist.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              print(storelist.length);
              print(desclist.length);

            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          storelist[index],
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );

  }
}

// This is a block of Model Dialog



class Mysql {
  static String host = 'dbproject.cft5govn0dbt.ap-northeast-2.rds.amazonaws.com',
      user = 'admin',
      password = '12341234',
      db = 'Data';
  static int port = 3306;
  Mysql();
  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host : host,
        port : port,
        user : user,
        password:password,
        db : db
    );
    return await MySqlConnection.connect(settings);
  }
}