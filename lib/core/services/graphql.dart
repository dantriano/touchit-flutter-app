import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

class Graphql {
  static String uri = FlutterConfig.get('GRAPHQL_URI');
  static String port = FlutterConfig.get('GRAPHQL_PORT');
  static String _token = FlutterConfig.get('GRAPHQL_TOKEN');

  static final HttpLink httpLink = HttpLink(
    '$uri:$port/api',
  );
  static final AuthLink authLink = AuthLink(getToken: () async => _token);

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
  static final Link link = authLink.concat(httpLink);

  static ValueNotifier<GraphQLClient> initailizeClient(String token) {
    // We're using HiveStore for persistence,
    _token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
          link: link,
          // The default store is the InMemoryStore, which does NOT persist to disk
          cache: GraphQLCache(
            store: HiveStore(),
          )
          //cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
          ),
    );

    return client;
  }
}
