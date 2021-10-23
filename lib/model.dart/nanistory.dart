class Story {
  String? id;
  String? postTitle;
  String? postDesc;
  String? postImage;

  Story({this.id, this.postTitle, this.postDesc, this.postImage});

  Story.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.postTitle = json["post_title"];
    this.postDesc = json["post_desc"];
    this.postImage = json["post_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["post_title"] = this.postTitle;
    data["post_desc"] = this.postDesc;
    data["post_image"] = this.postImage;
    return data;
  }
}
