import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../custom_base_model.dart';

class ProductViewModel extends CustomBaseViewModel {
  final _navigationService = locator<NavigationService>();

  NavigationService get navigationService => _navigationService;
}
