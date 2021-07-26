import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_flutter/bloc/simple-event.dart';
import 'package:http/http.dart' as http;
import 'package:start_flutter/model/sample-model.dart';

class SimpleBloc extends Bloc<SampleEvent, SimpleDataModel> {
  SimpleBloc(SimpleDataModel initialState) : super(initialState);

  @override
  Stream<SimpleDataModel> mapEventToState(SampleEvent event) async* {
    if (event is GetDataEvent) {
      SimpleDataModel newState = state;
      final result = await http.get(Uri.parse(
          'https://cdn.optimizely.com/datafiles/27EEEFtys3Y2jrkrtutqh.json'));
      newState = SimpleDataModel.fromJson(json.decode(result.body));
      yield (newState);
    }
  }
}
