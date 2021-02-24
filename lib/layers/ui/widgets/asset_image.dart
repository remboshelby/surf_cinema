import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/ui/widgets/image_from_remote.dart';

class SurfImage extends StatelessWidget {
  final double height;
  final double width;
  final String url;

  const SurfImage({
    Key key,
    this.height,
    this.width,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = GetIt.instance.get<Config>();
    return ImageFromRemote(
      imageUrl: '${config.apiBaseUrl}/icons/$url',
      height: height,
      width: width,
    );
  }
}
