import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ui/injection.config.dart';

final GetIt ii = GetIt.instance;

@InjectableInit()
void configureDependencies(String env) => ii.init(environment: env);

Future<void> resetInjection() async {
  await ii.reset();
}
