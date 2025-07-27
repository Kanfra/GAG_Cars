import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/makeModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:logger/logger.dart';

class MakeService with ChangeNotifier {
  final Logger logger = Logger();

  Future<List<Make>> fetchMakes() async {
    try {
      final response = await fetchApiData<MakeResponse>(
        endpoint: ApiEndpoint.makes, 
        fromJson: (json) => json == null 
          ? _emptyMakeResponse()
          : MakeResponse.fromJson(json),
      );
      return response.data;
    } catch(e) {
      logger.e("Failed to load makes", error: e);
      return [];
    }
  }

  MakeResponse _emptyMakeResponse() => MakeResponse(
    data: [], 
    links: PaginationLinks(first: '', last: '', prev: null, next: null), 
    meta: PaginationMeta(
      currentPage: 1, from: 1, lastPage: 1, links: [], 
      path: '', perPage: 15, to: 1, total: 0
    ),
  );
}