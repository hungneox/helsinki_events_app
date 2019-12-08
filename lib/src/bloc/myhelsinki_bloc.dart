import 'dart:async';

import 'package:helsinki_events_app/src/api/myhelsinki_api.dart';
import 'package:helsinki_events_app/src/models/event_model.dart';

import 'package:rxdart/rxdart.dart';

class MyHelsinkiBloc {
  final MyHelsinkiApi api;

  Stream<List<Event>> _events = Stream.empty();

  BehaviorSubject<String> _query = BehaviorSubject<String>();

  Stream<List<Event>> get events => _events;
  Sink<String> get query => _query;

  MyHelsinkiBloc(this.api) {
    _events = _query.distinct().asyncMap(api.makeRequest).asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}