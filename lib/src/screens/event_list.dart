import 'package:flutter/material.dart';
import 'package:helsinki_events_app/src/bloc/myhelsinki_bloc.dart';
import 'package:helsinki_events_app/src/provider/myhelsinki_provider.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _imageBloc = MyHelsinkiProvider.of(context);
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            _searchField(_imageBloc),
            _displayImage(_imageBloc),
          ],
        ));
  }

  Widget _searchField(MyHelsinkiBloc _bloc) {
    return TextField(
      onChanged: _bloc.query.add,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search for anything (e.g: music)'),
    );
  }

  Widget _displayImage(MyHelsinkiBloc _bloc) {
    return Expanded(
      child: StreamBuilder(
        stream: _bloc.events,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _buildImage(snapshot.data[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildImage(dynamic snapshot) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(
              snapshot.image,
              fit: BoxFit.fitWidth,
              height: 200.0,
            ),
            padding: EdgeInsets.only(
              bottom: 8.0,
            ),
          ),
          Text(snapshot.intro == null
              ? 'No description'
              : snapshot.intro),
        ],
      ),
    );
  }
}