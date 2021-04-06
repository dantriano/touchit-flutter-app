import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

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
  static final String _token = 'token';
  static final HttpLink httpLink = HttpLink(
    'http://localhost:5000/api',
  );
  static final AuthLink authLink = AuthLink(getToken: () async => _token);
  static final Link link = authLink.concat(httpLink);

  static ValueNotifier<GraphQLClient> initailizeClient(String token) {
    final AuthLink authLink = AuthLink(getToken: () async => _token);
    final Link link = authLink.concat(httpLink);
    // We're using HiveStore for persistence,
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

  static GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: Graphql.link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
  }
}
