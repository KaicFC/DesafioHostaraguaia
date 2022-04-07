import 'package:desafio_hostaraguaia/src/presentation/modules/details/details_controller.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/home/home_controller.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/search/search_controller.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';

Future<void> presentationInjection() async {
  inject.registerFactory<HomeController>(
    () => HomeController(inject.get()),
  );
  inject.registerFactory<SearchController>(
    () => SearchController(inject.get()),
  );
  inject.registerFactory<DetailsController>(
    () => DetailsController(inject.get()),
  );
}
