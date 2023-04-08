import 'package:get/get.dart';
import '../models/hero_card.dart';
import '../services/request.dart';

class ListOfCardsModel {
  List<HeroCard>? listOfCards = [];
  final Request request = Get.put(Request());

  Future<void> getListOfCards() async {
    Response response;
    response = await request.getList();

    if (response.statusCode == 200) {
      dynamic data = response.body['data'];
      if (data != null) {
        List<dynamic> list = data['results'];
        listOfCards?.addAll(list.map((e) => HeroCard.fromJson(e)));
      } else {}
    }
    if (response.statusCode == 401) {}
  }
}
