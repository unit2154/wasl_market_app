import 'package:wasl_market_app/features/dashboard/domain_layer/entities/widget_entity.dart';

abstract class DashboardRepo {
  List<DashboardEntity> getFeature();
}
