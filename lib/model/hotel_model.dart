class Hotel {
  int? id;
  String? name;
  String? adress;
  int? minimalPrice;
  String? priceForIt;
  int? rating;
  String? ratingName;
  List<String>? imageUrls;
  AboutTheHotel? aboutTheHotel;

  Hotel(
      {this.id,
      this.name,
      this.adress,
      this.minimalPrice,
      this.priceForIt,
      this.rating,
      this.ratingName,
      this.imageUrls,
      this.aboutTheHotel});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adress = json['adress'];
    minimalPrice = json['minimal_price'];
    priceForIt = json['price_for_it'];
    rating = json['rating'];
    ratingName = json['rating_name'];
    imageUrls = json['image_urls'].cast<String>();
    aboutTheHotel = json['about_the_hotel'] != null
        ? new AboutTheHotel.fromJson(json['about_the_hotel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['adress'] = this.adress;
    data['minimal_price'] = this.minimalPrice;
    data['price_for_it'] = this.priceForIt;
    data['rating'] = this.rating;
    data['rating_name'] = this.ratingName;
    data['image_urls'] = this.imageUrls;
    if (this.aboutTheHotel != null) {
      data['about_the_hotel'] = this.aboutTheHotel!.toJson();
    }
    return data;
  }
}

class AboutTheHotel {
  String? description;
  List<String>? peculiarities;

  AboutTheHotel({this.description, this.peculiarities});

  AboutTheHotel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    peculiarities = json['peculiarities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['peculiarities'] = this.peculiarities;
    return data;
  }
}