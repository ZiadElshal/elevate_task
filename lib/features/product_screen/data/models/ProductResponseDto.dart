import 'package:e_commerce_elevate_task/features/product_screen/domain/entities/ProductResponseEntity.dart';

/// id : 1
/// title : "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"
/// price : 109.95
/// description : "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"
/// category : "men's clothing"
/// image : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
/// rating : {"rate":3.9,"count":120}

class ProductResponseDto extends ProductResponseEntity{
  ProductResponseDto({
      super.id,
      super.title,
      super.price,
      super.description,
      super.category,
      super.image,
      super.rating,});

  ProductResponseDto.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? RatingDto.fromJson(json['rating']) : null;
  }
}

/// rate : 3.9
/// count : 120

class RatingDto extends RatingEntity{
  RatingDto({
      super.rate,
      super.count,});

  RatingDto.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['count'] = count;
    return map;
  }

}