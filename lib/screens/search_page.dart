import 'package:flutter/material.dart';
import 'package:my_wedding_test/models/store/store_model.dart';
import 'package:mysql1/mysql1.dart';
import 'package:my_wedding_test/repository/store_repository.dart';
import 'package:my_wedding_test/screens/home_screens/store_detail_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Store> studio =[];
  List<Store> makeup =[];
  List<Store> dress =[];
  List<Store> stores = [];

  @override
  void initState() {
    super.initState();
    storeInitState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        actions:
          <Widget>[

          ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Search...'
              ),
              onTap: () async {
                final result = await showSearch(
                    context: context, delegate: searchitem(stores: stores));
                print(result);
              },
            ),
          ),

        ],
      ),
    );
  }
  void storeInitState() async {
    var initDress = await StoreRepository().getDresses();
    var initMakeup = await StoreRepository().getMakeups();
    var initStudio = await StoreRepository().getStudios();

    setState(() {
      dress = initDress;
      makeup = initMakeup;
      studio = initStudio;
      stores.addAll(dress);
      stores.addAll(makeup);
      stores.addAll(studio);
    });
  }

}

class searchitem extends SearchDelegate<Store>{
  var result;
  bool isLike = false;
  searchitem({this.stores}):super();
  final List<Store> stores;
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
    final mylist = query.isEmpty? stores:
    stores.where((p)=>p.name.startsWith(query)).toList();
    return mylist.isEmpty? Text("No Results Found...",style: TextStyle(fontSize: 20),):
    ListView.builder(
      itemCount: stores.length,
      itemBuilder: (context,index){
        final Store listitem =stores[index];
        return ListTile(title:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(listitem.name,style: TextStyle(fontSize: 20),),
            Divider()
          ],
        ),
          onTap: (){
            result = stores[index];
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty? stores:
        stores.where((p)=>p.name.startsWith(query)).toList();
    return mylist.isEmpty? Text("No Results Found...",style: TextStyle(fontSize: 20),):
    ListView.builder(
      itemCount: stores.length,
      itemBuilder: (context,index){
        final Store listitem =stores[index];
        return ListTile(title:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(listitem.name,style: TextStyle(fontSize: 20),),
              Divider()
            ],
          ),
          onTap: (){
          isLike = true;
            query = stores[index].name;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StoreDetailPage(store: stores[index], isLike: isLike, category: index+1,)));
          },
        );
      },
    );
  }
}



