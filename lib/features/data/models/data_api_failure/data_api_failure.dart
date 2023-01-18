import 'package:equatable/equatable.dart';

/// Class model ini berfungsi untuk menyimpan info-info kegagalan dari API.
/// [statusCode] nilai respon kode dari API.
/// [message] message yang ada di respon API.
/// [httpMessage] message yang dibuat oleh http request atau Dio.
/// [errorData] informasi error tambahan dari respon API, mis. : validasi field
class DataApiFailure extends Equatable {
  final int? statusCode;
  final String? message;
  final String? httpMessage;
  final Map<String, dynamic>? errorData;

  const DataApiFailure({
    this.statusCode,
    this.message,
    this.httpMessage,
    this.errorData,
  });

  @override
  List<Object?> get props => [
        statusCode,
        message,
        httpMessage,
        errorData,
      ];

  @override
  String toString() {
    return 'DataApiFailure{statusCode: $statusCode, message: $message, httpMessage: $httpMessage, errorData: $errorData}';
  }
}
