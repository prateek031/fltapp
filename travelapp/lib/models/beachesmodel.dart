// ignore_for_file: unnecessary_new, prefer_collection_literals

class BeachesModel {
  int? id;
  String? location;
  String? country;
  String? imgurl;
  int? rating;
  int? price;
  String? discription;

  BeachesModel(
      {this.id,
      this.location,
      this.country,
      this.imgurl,
      this.rating,
      this.price,
      this.discription});

  BeachesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    country = json['country'];
    imgurl = json['imgurl'];
    rating = json['rating'];
    price = json['price'];
    discription = json['discription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] =id;
    data['location'] =location;
    data['country'] =country;
    data['imgurl'] =imgurl;
    data['rating'] =rating;
    data['price'] =price;
    data['discription'] =discription;
    return data;
  }
}