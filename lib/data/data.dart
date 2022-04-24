
class Album {
  int albumId;
  String title;
  String url;

  Album({required this.albumId,required this.title,required this.url});

  factory Album.fromJson(Map<String,dynamic> json){
    return Album(
      albumId: json["albumId"] as int,
      title: json["title"] as String,
      url: json["url"],
    );
  }
  @override
  String toString() {
    return title.toString();
  }
}