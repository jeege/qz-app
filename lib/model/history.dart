class HistoryItem {
  int id;
  String imgUrl;
  String movieUrl;
  String title;

  HistoryItem({this.id, this.imgUrl, this.movieUrl, this.title});

  HistoryItem.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    movieUrl = json['movieUrl'];
    title = json['title'];
    id = json['id'];
  }
}
