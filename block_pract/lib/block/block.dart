
import 'dart:async';



import 'package:block_pract/block/event.dart';
import 'counter_state.dart';


class  AppBlock {

  StreamController<CounterState> stateStreamController =  StreamController<CounterState>();
  StreamController<GeneralEvent> eventStreamController =  StreamController<GeneralEvent>();


  AppBlock.private (){
    eventStream.listen((event) {
      CounterState counterState = CounterState();
          if(event is IncrementEvent){
             stateSink.add(counterState..increment());
          }
          else if(event is DecrementEvent){
            stateSink.add(counterState..decrement());
          }
    });
  }

  StreamSink<CounterState> get stateSink {
    return stateStreamController.sink;
  }

  StreamSink<GeneralEvent> get eventSink {
    return eventStreamController.sink;
  }


  Stream<CounterState> get stateStream=>stateStreamController.stream;

  Stream<GeneralEvent> get eventStream=>eventStreamController.stream;





}