class CreditCard {
  late String expirationMonth;
  late String expirationYear;
  late String numberCard;
  late String cvv;
  late String name;
  late BrandCreditCard? brand;
  late TypeCard? type;

  CreditCard({
    required this.expirationMonth,
    required this.expirationYear,
    required this.numberCard,
    required this.cvv,
    required this.name,
    this.brand,
    this.type,
  });

  CreditCard.fromMap(Map<String, dynamic> json) {
    expirationMonth = json['expiration_month'];
    expirationYear = json['expiration_year'];
    numberCard = json['number_card'];
    cvv = json['cvv'];
    name = json['name'];
    brand = convertBrand(json['brand']);
    type = convertType(json['type']);
  }

  BrandCreditCard convertBrand(String brand) {
    Map<String, BrandCreditCard> map = {
      'master': BrandCreditCard.mastercard,
      'visa': BrandCreditCard.visa,
      'amex': BrandCreditCard.amex,
    };
    return map[brand] ?? BrandCreditCard.mastercard;
  }

  TypeCard convertType(String type) {
    Map<String, TypeCard> map = {
      'credit': TypeCard.credit,
      'debit': TypeCard.debit,
    };

    return map[type] ?? TypeCard.credit;
  }
}

enum BrandCreditCard {
  visa,
  amex,
  discover,
  mastercard,
  dinersclub,
  jcb,
  unionpay,
  maestro,
  elo,
  mir,
  hiper,
  hipercard,
  unknown
}

enum TypeCard {
  credit,
  debit,
}
