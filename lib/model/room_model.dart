class RoomModel {
  List<Rooms>? rooms;

  RoomModel({this.rooms});

  RoomModel.fromJson(Map<String, dynamic> json) {
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? id;
  String? name;
  int? price;
  String? pricePer;
  List<String>? peculiarities;
  List<String>? imageUrls;

  Rooms(
      {this.id,
      this.name,
      this.price,
      this.pricePer,
      this.peculiarities,
      this.imageUrls});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    pricePer = json['price_per'];
    peculiarities = json['peculiarities'].cast<String>();
    imageUrls = json['image_urls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['price_per'] = this.pricePer;
    data['peculiarities'] = this.peculiarities;
    data['image_urls'] = this.imageUrls;
    return data;
  }
}
