import 'package:equatable/equatable.dart';
import 'package:pokemon/core/util/constant_error_message.dart';
import 'package:pokemon/features/data/models/data_api_failure/data_api_failure.dart';

/// Class abstrak [Failure].
abstract class Failure extends Equatable {}

/// Class ini berfungsi sebagai state jika app mengalami kegagalan dari API.
/// Dan class ini memiliki property [dataApiFailure].
class ServerFailure extends Failure {
  final DataApiFailure dataApiFailure;

  ServerFailure(this.dataApiFailure);

  @override
  List<Object> get props => [
        dataApiFailure,
      ];

  @override
  String toString() {
    return 'ServerFailure{dataApiFailure: $dataApiFailure}';
  }
}

/// Class ini berfungsi sebagai state jika app mengalami kegagalan ketika mengambil data dari lokal/database.
/// Dan class ini memiliki property [errorMessage].
class CacheFailure extends Failure {
  final String errorMessage;

  CacheFailure(this.errorMessage);

  @override
  List<Object> get props => [
        errorMessage,
      ];

  @override
  String toString() {
    return 'CacheFailure{errorMessage: $errorMessage}';
  }
}

/// Class ini berfungsi sebagai state jika app dalam kondisi tidak terhubung ke mobile data/wifi.
/// Didalam class ini memiliki property [errorMessage].
class ConnectionFailure extends Failure {
  final String errorMessage = ConstantErrorMessage().connectionError;

  @override
  List<Object> get props => [
        errorMessage,
      ];

  @override
  String toString() {
    return 'ConnectionFailure{errorMessage: $errorMessage}';
  }
}

class ParsingFailure extends Failure {
  final String errorMessage;

  ParsingFailure(this.errorMessage);

  @override
  List<Object> get props => [
        errorMessage,
      ];

  @override
  String toString() {
    return 'ParsingFailure{errorMessage: $errorMessage}';
  }
}
