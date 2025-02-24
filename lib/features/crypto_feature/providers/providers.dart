import 'package:crypto_app/features/crypto_feature/api/models/user_model.dart';
import 'package:crypto_app/features/crypto_feature/providers/sign_provider_model.dart';
import 'package:crypto_app/features/crypto_feature/providers/tnb_provider_model.dart';
import 'package:crypto_app/features/crypto_feature/providers/user_provider_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tnbProvider = ChangeNotifierProvider(
  (ref) => TnbProviderModel(selectedIndex: 0),
);

final signProvider = ChangeNotifierProvider(
  (ref) => SignProviderModel(isLoading: false),
);

final userProvider = ChangeNotifierProvider(
  (ref) => UserProviderModel(userModel: UserModel()),
);
