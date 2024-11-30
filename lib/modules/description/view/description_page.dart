
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class DescriptionPage extends StatefulWidget {
  const DescriptionPage({
    super.key,
    required this.id,
  });
  final int id;
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  late List response = [];
    Future<void> getinfoinbdid() async{
    try{
      String uri = "http://readershavenapi-dorat0.amvera.io/books/${widget.id}";
      var res = await http.get(Uri.parse(uri));
      
      setState(() {
        response = jsonDecode(res.body);
      });
     
    }catch(e){
      print(e);
    }
  }
  @override
  void initState(){
    super.initState();
    getinfoinbdid();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return response.isEmpty ? Center(child: CircularProgressIndicator(
                  color: theme.indicatorColor,
                  strokeWidth: 3,
      ),
      ): Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text(response[0]["title"]),
      ),
      body: Column(children: [
          SizedBox(height: 10,),
          SizedBox(child: Image.network(response[0]["image_url"]), width: 150, height: 150),
          SizedBox(height: 10,),
          Center(child: Text(response[0]["title"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
          SizedBox(height: 5,),
          Center(child: Text(response[0]["date"], style: TextStyle(fontStyle: FontStyle.italic),)),
          SizedBox(height: 5,),
          SizedBox(width: 250,child: Center(child: Text(response[0]["description"]),)),
        ],),
    );
  }
}