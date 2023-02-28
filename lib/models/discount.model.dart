class Discount {
  late String id;
  late double priceWithDiscount;
  late double percentDiscount;

  Discount({
    required this.id,
    required this.priceWithDiscount,
    required this.percentDiscount,
  });

  Discount.fromMap(Map<String, dynamic> json) {
    id = json['ID'];
    priceWithDiscount = json['price_with_discount'];
    percentDiscount = json['percent_discount'];
  }
}
