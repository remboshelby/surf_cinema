import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_cinema/app/config.dart';
import 'package:surf_cinema/layers/ui/widgets/image_from_remote.dart';

class _AssetImage extends StatelessWidget {
  final double size;
  final String assetId;

  const _AssetImage({Key key, this.size, this.assetId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = GetIt.instance.get<Config>();
    return ImageFromRemote(
      imageUrl: '${config.apiBaseUrl}/icons/$assetId',
      size: size,
    );
  }
}