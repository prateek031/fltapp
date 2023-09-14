// ignore_for_file: dead_code

class Categories {
  late final bool categoriesReturn;
   late final  List<Data> data;
    Categories({
        required this.categoriesReturn,
        required this.data,
    });
  
  
  Categories.fromJson(Map<String, dynamic> json){
    categoriesReturn = json['return']?? false;
    data = List.from(json['data']??[]).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['return'] = categoriesReturn;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
     this.image,
    required this.time,
    required this.createdAt,
    required this.updatedAt,
     this.deletedAt,
  });
  late final int id;
  late final String name;
  late final String? image;
  late final int time;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = null;
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['time'] = time;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}