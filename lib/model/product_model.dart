class Product {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product(
      //un named constructer
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  Product.fromMap(Map<String, dynamic> map) {
    //named constructer
    id = map['id'];
    title = map['title'];
    price = map['price'];
    description = map['description'];
    image = map['image'];
    category = map['category'];
    //rating = map['rating']??' ';
    rating = map['rating'] != null ? new Rating.fromMap(map['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  num? rate;
  int? count;
  Rating({this.rate, this.count});
  Rating.fromMap(Map<String, dynamic> map) {
    rate = map['rate'];
    count = map['count'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mp = new Map<String, dynamic>();
    mp['rate'] = this.rate;
    mp['count'] = this.count;
    return mp;
  }
}
