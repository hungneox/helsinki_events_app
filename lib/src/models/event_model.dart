class Event {
  String id;
  String intro;
  String description;
  String image;

  Event(this.id, this.intro, this.description, this.image);

  Event.fromJson(Map parsedJson) {
    id = parsedJson['id'];
    intro = parsedJson['description']['intro'];
    description = parsedJson['description']['body'];
    image = parsedJson['description']['images'][0]['url'];
  }
}
