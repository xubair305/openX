import 'package:openx/app/core/base/index.dart';

class BaseRepository<P extends BaseProvider> {
  BaseRepository({
    required this.provider,
  });

  final P provider;
}
