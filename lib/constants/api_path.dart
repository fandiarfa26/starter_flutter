import 'package:starter_flutter/constants/app_constants.dart';

Uri postsUrl = Uri.parse(domainWeb + '/posts');

Uri postDetailUrl(String id) {
  return Uri.parse(domainWeb + '/posts/$id');
}
