

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


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
  var favorite = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text(widget.id.toString()),
      ),
      // body: Center(
      //   child: Column(children: [
      //     SizedBox(child: Image.asset('assets/icons/icon_app.png'), width: 100, height: 100),
      //     SizedBox(height: 10,),
      //     Center(child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
      //     SizedBox(height: 5,),
      //     Center(child: Text(widget.data, style: TextStyle(fontStyle: FontStyle.italic),)),
      //     SizedBox(height: 5,),
      //     SizedBox(width: 250,child: Center(child: Text(widget.description),)),
      //     SizedBox(
      //       width: 150,
      //       child: 
      //       IconButton(onPressed: () {setState(() {favorite = !favorite;});}, 
      //       icon: favorite?Icon(Icons.favorite, color: theme.indicatorColor,) :Icon(Icons.favorite_outline, color: theme.indicatorColor,)),)
      //   ],),
      // ),
    );
  }
}