import 'package:graphql_basic/core/constants/url_constants.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ConnectClient {
  static HasuraConnect hasuraConnect = HasuraConnect(UrlConstants.apiUrl);
}
