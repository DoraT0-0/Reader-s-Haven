import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import '../widgets/widgets.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  static List<ListBookDB> listbookBd = [];
  List<ListBookDB> displayList = List.from(listbookBd); 
  bool isSearchClicked = false;

  void filterList(String value){
    setState(() {
      displayList = listbookBd
      .where((element) => element.title!.toLowerCase().contains(value.toLowerCase()))
      .toList();
    });
  }

  Future<void> getinfoinbd() async{
    try{
      String uri = "http://readershavenapi-dorat0.amvera.io/books";
      var res = await http.get(Uri.parse(uri));
      List response = jsonDecode(res.body);
      List<ListBookDB> listbookBd_test = []; 
      for(int i =0;i < response.length;i++){
        listbookBd_test.add(ListBookDB(response[i]["title"], 'https://drive.google.com/uc?export=download&id=${response[i]["book_url"]}', response[i]["id"]));
      }
      setState(() {
        listbookBd = listbookBd_test;
        if(!isSearchClicked) displayList = listbookBd;
      });
    }catch(e){
      print(e);
    }
  }
  @override
  void initState(){
    super.initState();
    getinfoinbd();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
      backgroundColor: theme.primaryColor,
      title: isSearchClicked ? TextField(
          onChanged: (value) => filterList(value),
          decoration: InputDecoration(border: InputBorder.none, hintText: "Поиск..."),
          ) : const Text("Поисковик"),
      actions: [
        IconButton(onPressed: () {setState(() {if(isSearchClicked)filterList(''); isSearchClicked = !isSearchClicked;});}, icon: Icon(isSearchClicked ? Icons.close : Icons.search)),
      ],
      ),
      body: RefreshIndicator(child: CardBookSearch(listBookDB: displayList), onRefresh: getinfoinbd, color: theme.indicatorColor,)
    );
  }
}
