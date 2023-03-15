import 'package:church_app/controllers/config.controller.dart';
import 'package:get/get.dart';

import '../models/credit_card.model.dart';

class PaymentControllerX extends GetxController {
  RxList<CreditCard> cards = <CreditCard>[
    CreditCard(
      expirationMonth: '02',
      expirationYear: '2027',
      numberCard: '1234 1324 1234 1234',
      cvv: '217',
      name: 'VINICIUS B LIMA',
      brand: BrandCreditCard.visa,
      type: TypeCard.credit,
    )
  ].obs;

  Rx<CreditCard> newCard = CreditCard(
    expirationMonth: '00',
    expirationYear: '0000',
    numberCard: '',
    cvv: '',
    name: '',
  ).obs;

  Rx<int> indexInstallment = (-1).obs;
  Rx<int> indexMethod = (-1).obs;

  Rx<PaymentMethods> method = (PaymentMethods.pix).obs;

  void addCard({required CreditCard card}) {
    cards.add(card);
    update();
  }

  void updateIndexInstallment({required int value}) {
    indexInstallment.value = value;
    update();
  }

  void updateIndexMethod({required int value}) {
    indexMethod.value = value;
    update();
  }

  void changeNewCard({required CreditCard item}) {
    newCard.value = item;
    update();
  }

  void updateMethod({required PaymentMethods paymentMethod}) {
    method.value = paymentMethod;
    update();
  }
}
