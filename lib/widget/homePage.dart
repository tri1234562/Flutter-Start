import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_flutter/bloc/simple-bloc.dart';
import 'package:start_flutter/bloc/simple-event.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.sampleBloc})
      : super(key: key);
  final String title;
  final SimpleBloc sampleBloc;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // body: BlocProvider(
        //   create: (context) => widget.sampleBloc,
        //   child: Text('aa'),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                'Current Version: ${widget.sampleBloc.state.version}',
                style: Theme.of(context).textTheme.headline4,
              ),
              TextButton(
                  onPressed: () => widget.sampleBloc.add(GetDataEvent()),
                  child: Text('Click Me'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Get Data',
          onPressed: () => {print(widget.sampleBloc.state.version)},
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
