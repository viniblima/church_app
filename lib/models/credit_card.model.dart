class CreditCard {
  late String expirationMonth;
  late String expirationYear;
  late String numberCard;
  late String cvv;
  late String name;

  CreditCard({
    required this.expirationMonth,
    required this.expirationYear,
    required this.numberCard,
    required this.cvv,
    required this.name,
  });

  CreditCard.fromMap(Map<String, dynamic> json) {
    expirationMonth = json['expiration_month'];
    expirationYear = json['expiration_year'];
    numberCard = json['number_card'];
    cvv = json['cvv'];
    name = json['name'];
  }
}
