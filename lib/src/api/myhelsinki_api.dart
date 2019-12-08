
import 'package:http/http.dart' show get;
import 'dart:convert';
import '../models/event_model.dart';

class MyHelsinkiApi {
  Future<List<Event>> makeRequest(String tagsSearch) async {
    List<Event> events = [];
    final response = await get(
        'http://open-api.myhelsinki.fi/v1/events/?tags_search=$tagsSearch&limit=10&start=10');
    final parsedResponse = json.decode(utf8.decode(response.bodyBytes));
    final List results = parsedResponse['data'];
    results.forEach((result) => events.add(Event.fromJson(result)));
    return events;
  }
}
