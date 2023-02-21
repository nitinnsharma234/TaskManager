import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharptimemanagement/Model/Your_Tasks.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName ="/favScreen";
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<YourTasks>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Favourites Screen"),),
      body: ListView.builder(itemCount:provider.tasks.length,itemBuilder:(ctx,idx) {
          return const ListTile(title: Text("Helloooooooo"),);
      },),
    );
  }
}
