import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

initLocator() {
  locator.registerFactoryParam<Students, String, String>(
      (param1, param2) => Students(name: param1, email: param2));

  locator.registerLazySingleton<Service>(() => ServiceImpl());
}

class Students {
  String? name;
  String? email;
  Students({this.name, this.email});
}

abstract class Service {
  Map<String, dynamic> fetchData();
}

class ServiceImpl implements Service {
  @override
  Map<String, dynamic> fetchData() {
    print("fetch data");
    return Map();
  }
}

class ServicesViewModel {
  Service _service = locator<Service>();
}
