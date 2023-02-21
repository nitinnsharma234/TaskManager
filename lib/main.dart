import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharptimemanagement/Model/Tasks.dart';
import 'package:sharptimemanagement/Model/Your_Tasks.dart';
import 'package:sharptimemanagement/favouriteScreen.dart';
import 'package:sharptimemanagement/theme_manager.dart';
import 'package:sharptimemanagement/tools/DottedMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>YourTasks(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sharp Time Management',
        home: const MyHomePage(),
        routes: {
          FavouriteScreen.routeName: (ctx) => const FavouriteScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    FocusNode a = FocusNode();
    FocusNode b = FocusNode();
    TextEditingController c= TextEditingController();
    TextEditingController a1= TextEditingController();
    TextEditingController b1= TextEditingController();
    var provider =Provider.of<YourTasks>(context);
    late String title ;
    late String description;
    late double rewardScore;
    Future <void> saveForm()
    {
       _formKey.currentState?.save();
       return(Future.value());

    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms"),
        actions: [
          IconButton(onPressed: () async {
             await saveForm();
             provider.addTask(Tasks(title: title, description: description, rewardScore: rewardScore));
            }, icon: const Icon(Icons.save)),
          DottedMenu(context),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Add a new Task"),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0)),
                      focusNode: b,
                      onFieldSubmitted: (_){
                        FocusScope.of(context).requestFocus(a);
                      },
                      textInputAction: TextInputAction.next,
                      onSaved: (value){
                        print("Title:$value");
                        title=value!;
                        c.text="";
                      },
                      controller: c,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("write a min discription about it !!"),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0)),
                        onSaved: (value){
                          print("Description :$value");
                          description=value!;
                        }),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Write a date !!"),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0)),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (double.parse(value!) > 0) {
                          return "value greater than 0";
                        }
                      },
                      focusNode: a,
                      onSaved: (value){
                        print("Doubel $value");
                        rewardScore=double.parse(value!);
                      },
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            flex: 2,
            child: Consumer<YourTasks>(builder: (ctx,provider,child){
              List tasks=provider.tasks as List<Tasks>;
              return tasks.isNotEmpty? SingleChildScrollView(
                child: Column(
                    children:[Text("Let's Do it"),...tasks.map((e) => ListTile(hoverColor:Colors.cyan,title: Text(e.title),subtitle: Text(e.description),trailing: Text(e.rewardScore.toString()),)).toList()
                ]),
              ):Container(child: Image.asset("assets/images/noFound.png",));
            }),
          ),
        ],
      ),

    );
  }
}

