import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:touchit_app/core/services/shared_preferences_service.dart';

class Graphql {
  /* Connection by Socket
  static final WebSocketLink websocketLink = WebSocketLink(
    url: 'wss://hasura.io/learn/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initPayload: {
        'headers': {'Authorization': _token},
      },
    ),
  );
  static final Link link = authLink.concat(httpLink).concat(websocketLink);
  */
  static final HttpLink httpLink = HttpLink(
    'http://localhost:5000/api',
  );
  static ValueNotifier<GraphQLClient> initailizeClient() {
    // We're using HiveStore for persistence,
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      getClient(),
    );
    return client;
  }

  static GraphQLClient getClient() {
    final AuthLink authLink =
        AuthLink(getToken: () async => sharedPreferenceService.token);
    final Link link = authLink.concat(httpLink);
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
  }
}
