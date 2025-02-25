import '../../../../core/data/result.dart';
import '../../domain/user_data_domain.dart';

abstract class HomeRepository {
  Future<Result<UserData>> getUserData();
}