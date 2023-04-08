import 'package:get/get_connect/connect.dart';
import 'package:wordle_mobile/helpers/hero_details_options.dart';
import 'package:wordle_mobile/helpers/hero_details_options_to_string.dart';
import 'package:wordle_mobile/helpers/md5_encoder.dart';
import 'package:wordle_mobile/utils/app_constants.dart';

class Request extends GetConnect {
  Future<Response> getList() async {
    String dateTime = '${DateTime.now().millisecondsSinceEpoch}';
    String hash = Md5Encoder().encoder(dateTime);
    Response response;
    response = await get(
      AppConstants.url,
      query: {
        'apikey': AppConstants.apiKeyPublic,
        'hash': hash,
        'ts': dateTime
      },
    );
    return response;
  }

  Future<Response> getHeroDetails(int id, HeroDetailsOptions detail) async {
    String dateTime = '${DateTime.now().millisecondsSinceEpoch}';
    String hash = Md5Encoder().encoder(dateTime);
    Response response;
    String typeDetail = heroDetailsOptionsToStrig(detail);
    response = await get(
      '${AppConstants.url}/$id/$typeDetail',
      query: {
        'apikey': AppConstants.apiKeyPublic,
        'hash': hash,
        'ts': dateTime
      },
    );
    return response;
  }
}
