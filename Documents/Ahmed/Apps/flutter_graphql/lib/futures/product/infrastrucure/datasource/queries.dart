import 'package:graphql_flutter/graphql_flutter.dart';

class Queries{
   final   queryProduct = gql("""
    
{
  products(first: 10, channel: "default-channel") {
    edges {
      node {
        media {
          url
        }
        id
        name
        description
      }
    }
  }
}

    """);
}