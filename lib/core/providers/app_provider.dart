import 'package:crypto_app/core/providers/app_provider_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appProvider = ChangeNotifierProvider(
  (ref) => AppProviderModel(selectedIndex: 0),
);
