import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:serdes_json/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_cinema/drivers/json.dart';
import 'package:surf_cinema/layers/exceptions/common.dart';

part 'schemes.g.dart';

@SerdesJson(convertToSnakeCase: true)
class AssetsResponseScheme {
  Optional<String> posterPath;
  Optional<bool> adult;
  Optional<String> overview;
  Optional<String> releaseDate;
}
