class Entities {
  String? imageLink;
  String? textTitle;
  String? textDesc;
  String? textPrice;

  Entities({this.imageLink, this.textTitle, this.textDesc, this.textPrice});

  Entities.fromJson(Map<String, dynamic> json) {
    imageLink = json["imageLink"];
    textTitle = json["textTitle"];
    textDesc = json["textDesc"];
    textPrice = json["textPrice"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["imageLink"] = this.imageLink;
    data["TextTitle"] = this.textTitle;
    data["textDesc"] = this.textDesc;
    data["textPrice"] = this.textPrice;
    return data;
  }
}
