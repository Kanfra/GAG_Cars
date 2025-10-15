import 'package:freezed_annotation/freezed_annotation.dart';
import 'searchItemModel.dart';

part 'searchResponseModel.freezed.dart';
part 'searchResponseModel.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  const factory SearchResponse({
    required bool success,
    required String message,
    List<SearchItem>? data,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}