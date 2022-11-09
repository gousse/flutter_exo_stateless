class Post {
  String name;
  String time;
  String imagePath;
  String description;
  int likes;
  int comments;

  Post(
      {required this.name,
      required this.time,
      required this.imagePath,
      required this.description,
      this.likes = 0,
      this.comments = 0});

  String getTime() => "Il y a $time";
  String getLikes() {
    return "$likes  j'aime";
  }

  String getComments() {
    return comments > 1 ? "$comments commentaire" : "$comments commentaires";
  }
}
