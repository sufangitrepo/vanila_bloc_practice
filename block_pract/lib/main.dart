import 'dart:async';

import 'package:block_pract/block/block.dart';
import 'package:block_pract/block/counter_state.dart';
import 'package:block_pract/block/event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}



class FirstPage extends StatelessWidget {
   FirstPage({Key? key}) : super(key: key);

  final AppBlock appBlock = AppBlock.private();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
             Center(child: StreamBuilder<CounterState>(stream:appBlock.stateStream,builder:(context , snapshot){
              if(snapshot.hasData){
                return Text('${snapshot.data!.counter}');
              }
              else if(snapshot.hasError){
                return Text('Error');
              }
              else{
                return Text('waiting');
              }
      }, initialData:CounterState() , ),),
        ],
      ),
      floatingActionButton: Row(children: [
        FloatingActionButton(onPressed: (){
          appBlock.eventSink..add(IncrementEvent());
        },child: Icon(Icons.add),),
        FloatingActionButton(onPressed: (){
          appBlock.eventSink..add(DecrementEvent());
      },child: Icon(Icons.remove),)],),
    );
  }
}
