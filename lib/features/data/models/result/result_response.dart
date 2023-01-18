import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_response.g.dart';

@JsonSerializable()
class ResultResponse extends Equatable {
  final String? name;
  final String? url;

  ResultResponse({
    this.name,
    this.url,
  });

  static ResultResponse fromJson(Map<String, dynamic> json) => _$ResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);

  @override
  List<Object?> get props => [
        name,
        url,
      ];

  @override
  String toString() {
    return super.toString();
  }
}
