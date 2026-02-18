import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wasl_market_app/core/network/dio_api_consumer.dart';
import 'package:wasl_market_app/features/auth/domain_layer/use_cases/get_user.dart';
import 'package:wasl_market_app/features/home/data_layer/data_sources/home_data_source.dart';
import 'package:wasl_market_app/features/home/data_layer/data_sources/home_data_source_impl.dart';
import 'package:wasl_market_app/features/home/data_layer/repository/home_reop_impl.dart';
import 'package:wasl_market_app/features/home/domain_layer/repository/home_repo.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_companies.dart';
import 'package:wasl_market_app/features/home/domain_layer/usecases/get_products.dart';
import 'package:wasl_market_app/features/home/presentation_layer/providers/cubit/home_cubit.dart';
import 'package:wasl_market_app/features/ordres/data_layer/data_sources/orders_data_source.dart';
import 'package:wasl_market_app/features/ordres/data_layer/repository/orders_repo_impl.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/repository/orders_repo.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/usecases/find_order_by_item.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/usecases/get_orders.dart';
import 'package:wasl_market_app/features/ordres/domain_layer/usecases/update_order_state.dart';
import 'package:wasl_market_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:hive/hive.dart';
import 'package:wasl_market_app/core/database/db_boxes.dart';
import 'package:wasl_market_app/core/network/api_consumer.dart';
import 'package:wasl_market_app/features/auth/data_layer/data_sources/auth_data_source.dart';
import 'package:wasl_market_app/features/auth/data_layer/data_sources/auth_data_source_impl.dart';
import 'package:wasl_market_app/features/auth/data_layer/model/sub_model/token_model.dart';
import 'package:wasl_market_app/features/auth/data_layer/model/user_model.dart';
import 'package:wasl_market_app/features/auth/data_layer/repo_impl/auth_repo_impl.dart';
import 'package:wasl_market_app/features/auth/domain_layer/repo/auth_repo.dart';
import 'package:wasl_market_app/features/auth/domain_layer/use_cases/get_token.dart';
import 'package:wasl_market_app/features/auth/domain_layer/use_cases/logout.dart';
import 'package:wasl_market_app/features/auth/domain_layer/use_cases/send_otp.dart';
import 'package:wasl_market_app/features/auth/domain_layer/use_cases/verify_otp.dart';
import 'package:wasl_market_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';
part 'auth_dependencies.dart';
part 'orders_dependencies.dart';
part 'db_dependencies.dart';
part 'home_dependencies.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  await dbDependencies();
  await authDependencies();
  await homeDependencies();
  await ordersDependencies();
}
