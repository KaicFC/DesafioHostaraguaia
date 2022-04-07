import 'package:desafio_hostaraguaia/src/shared/di/domain_injection.dart';
import 'package:desafio_hostaraguaia/src/shared/di/presentation_injection.dart';
import 'package:get_it/get_it.dart';

GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  await domainInjection();
  await presentationInjection();
}