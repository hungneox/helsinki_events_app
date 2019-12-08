import 'package:flutter/material.dart';
import 'package:helsinki_events_app/src/api/myhelsinki_api.dart';
import 'package:helsinki_events_app/src/bloc/myhelsinki_bloc.dart';
import 'package:helsinki_events_app/src/provider/myhelsinki_provider.dart';
import 'package:helsinki_events_app/src/screens/event_list.dart';


class App extends StatelessWidget {
  Widget build(BuildContext context) {
    // wrap our application with the Images Provider
    return MyHelsinkiProvider(
      imageBloc: MyHelsinkiBloc(MyHelsinkiApi()),
      child: MaterialApp(
        title: 'View Images',
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('View Images'),
          ),
          body: EventList(),
        ),
      ),
    );
  }
}
