import 'package:currencyapp/features/historical_data/data/models/historical_data_response_model.dart';

const _jsonData = {
  "USD_PHP": {
    "2025-09-05": 57.186502,
    "2025-09-06": 56.995504,
    "2025-09-07": 56.703704,
    "2025-09-08": 56.703704,
    "2025-09-09": 56.860496,
    "2025-09-10": 56.772498,
    "2025-09-11": 57.074497,
  },
  "PHP_USD": {
    "2025-09-05": 0.017487,
    "2025-09-06": 0.017545,
    "2025-09-07": 0.017636,
    "2025-09-08": 0.017636,
    "2025-09-09": 0.017582,
    "2025-09-10": 0.017614,
    "2025-09-11": 0.017521,
  },
};

class EmptyHistoricalData {
  static final HistoricalDataResponseModel data =
      HistoricalDataResponseModel.fromJson(_jsonData);
}
