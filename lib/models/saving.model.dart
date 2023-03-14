class Saving {
  String? imageLink;
  String? textTitle;
  String? textDesc;
  String? textPrice;
  String? currentSum;
  Saving(
      {this.imageLink,
      this.textTitle,
      this.textDesc,
      this.textPrice,
      this.currentSum});

  Saving.fromJson(Map<String, dynamic> json) {
    imageLink = json["imageLink"];
    textTitle = json["textTitle"];
    textDesc = json["textDesc"];
    textPrice = json["textPrice"];
    currentSum = json["currentSum"];
  }
}
