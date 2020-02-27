import 'package:qz_app/config.dart';
import 'package:qz_app/utils/httpUtil.dart';

getNav(String type) {
  return http.get('$api/nav/$type');
}
