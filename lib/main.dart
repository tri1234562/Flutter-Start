import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_flutter/bloc/simple-bloc.dart';
import 'package:start_flutter/widget/homePage.dart';

import 'model/sample-model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var _sampleBloc = new SimpleBloc(SimpleDataModel(
      '', [], [], false, '', [], [], [], [], [], [], false, '', [], ''));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          MyHomePage(title: 'Flutter Demo Home Page', sampleBloc: _sampleBloc),
    );
  }
}
