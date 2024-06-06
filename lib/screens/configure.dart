import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:healthcare/constant/constant.dart';

Future configureApp() async {
  // init Supabase singleton
  // no localStorage provided, fallback to use hive as default
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnnonKey,
  );
}
