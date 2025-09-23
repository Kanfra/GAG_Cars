import 'package:gag_cars_frontend/Pages/HomePage/Models/makeAndModelModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:logger/logger.dart';

class MakeAndModelService {
  Future<MakeAndModelResponse> fetchMakesWithModels() async { // Changed return type
    final logger = Logger();
    try {
      final response = await fetchApiData<MakeAndModelResponse>(
        endpoint: ApiEndpoint.brands,
        fromJson: (json) {
          if (json == null) {
            return MakeAndModelResponse(
              data: [],
              links: PaginationLinks(
                first: '',
                last: '',
                prev: null,
                next: null,
              ),
              meta: PaginationMeta(
                currentPage: 1,
                from: 1,
                lastPage: 1,
                links: [],
                path: '',
                perPage: 15,
                to: 1,
                total: 0,
              ),
            );
          }
          return MakeAndModelResponse.fromJson(json);
        },
      );
      return response; // Now returns MakeAndModelResponse directly
    } catch (e) {
      logger.e("Failed to load vehicle makes with models", error: e);
      rethrow;
    }
  }
}
