/// id : 1
/// title : "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"
/// price : 109.95
/// description : "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"
/// category : "men's clothing"
/// image : "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
/// rating : {"rate":3.9,"count":120}

class ProductResponseEntity {
  ProductResponseEntity({
      this.id, 
      this.title, 
      this.price, 
      this.description, 
      this.category, 
      this.image, 
      this.rating,});

  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  RatingEntity? rating;

}

/// rate : 3.9
/// count : 120

class RatingEntity {
  RatingEntity({
      this.rate, 
      this.count,});

  num? rate;
  num? count;

}