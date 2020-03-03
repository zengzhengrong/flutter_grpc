import 'dart:async';

import 'package:grpc/grpc.dart';

import 'package:api_repository/api_repository.dart';

import '../api_repository.dart';

class Client {
  ClientChannel channel;
  KeycloakServiceClient stub;
  String token;
  Map<String, String> metadata;
  CallOptions opts;

  Client(this.token) {
    channel = ClientChannel('192.168.1.235',
        port: 8000,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = KeycloakServiceClient(channel);
    metadata = {'authorization': 'Bearer $token'};
    opts = CallOptions(metadata: metadata);
  }

  Future<Reply> getPublic() async {
    final request = Empty();
    final call = stub.public(request, options: opts);

    final response = await call;
    // await channel.shutdown();
    print(response);
    return response;
  }

  Future<Reply> getSecured() async {
    final request = Empty();
    final call = stub.secured(request, options: opts);

    final response = await call;
    // await channel.shutdown();
    print(response);
    return response;
  }
}

main(List<String> args) async {
  final token =
      "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJUYldRM1p1aDRWMzFOb0lfV1B0cnE5eGR5UzhhRzdZNFo0RXZnT0pfakNVIn0.eyJqdGkiOiIyMTU0Nzg0OS0yYTg1LTQ3NmYtOWZjZS1hNTY3YTkxZmY0YzIiLCJleHAiOjE1ODMwNzExMzUsIm5iZiI6MCwiaWF0IjoxNTgzMDcwODM1LCJpc3MiOiJodHRwOi8va2V5Y2xvYWstaW5ncmVzcy1sNy1odHRwLmtleWNsb2FrLjE5Mi4xNjguMS4yMDMueGlwLmlvL2F1dGgvcmVhbG1zL2RlbW8iLCJhdWQiOlsicmVhbG0tbWFuYWdlbWVudCIsImV4YW1wbGUtcnBjLWdvIiwiYnJva2VyIiwiYWNjb3VudCJdLCJzdWIiOiI1NWZlZGI2YS1iODkyLTQ5MWItYTg4My04MzAyMjFiMDYwZDAiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJmbHV0dGVyX2RldiIsImF1dGhfdGltZSI6MCwic2Vzc2lvbl9zdGF0ZSI6Ijc3NzhkMmY3LTM5YTItNDJiZi1hYWRlLWEzOTg0YjM2Yjk3MiIsImFjciI6IjEiLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7InJlYWxtLW1hbmFnZW1lbnQiOnsicm9sZXMiOlsidmlldy1yZWFsbSIsInZpZXctaWRlbnRpdHktcHJvdmlkZXJzIiwibWFuYWdlLWlkZW50aXR5LXByb3ZpZGVycyIsImltcGVyc29uYXRpb24iLCJyZWFsbS1hZG1pbiIsImNyZWF0ZS1jbGllbnQiLCJtYW5hZ2UtdXNlcnMiLCJxdWVyeS1yZWFsbXMiLCJ2aWV3LWF1dGhvcml6YXRpb24iLCJxdWVyeS1jbGllbnRzIiwicXVlcnktdXNlcnMiLCJtYW5hZ2UtZXZlbnRzIiwibWFuYWdlLXJlYWxtIiwidmlldy1ldmVudHMiLCJ2aWV3LXVzZXJzIiwidmlldy1jbGllbnRzIiwibWFuYWdlLWF1dGhvcml6YXRpb24iLCJtYW5hZ2UtY2xpZW50cyIsInF1ZXJ5LWdyb3VwcyJdfSwiZXhhbXBsZS1ycGMtZ28iOnsicm9sZXMiOlsidW1hX3Byb3RlY3Rpb24iLCJhZG1pbiIsInVzZXIiXX0sImJyb2tlciI6eyJyb2xlcyI6WyJyZWFkLXRva2VuIl19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50Iiwidmlldy1hcHBsaWNhdGlvbnMiLCJ2aWV3LWNvbnNlbnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicHJlZmVycmVkX3VzZXJuYW1lIjoienpyIn0.Iq1Aa6iJl7HN_fhjpo85j5W2pI7h3Pc-Izdxjka-mVjmQwSUdbNJpHC9Cv5ByHPwSia_V5ovlsFG3zYmJSxEWPqDWSMleo8wph7VwnV7EL_nyfdV-Y10HLQW-H89TfhUZsKk6nzwOrUEm6evGfH9Ef6sdA8rVaOHpFUXlBr7ix7kifFycpORcvg-5jGFQ2Jw3G_16x_9UJo0B2zAIqk9ARLDklFUJDmhdbYLwYYWdehbcmVWtoJjFKRnjexxb4V4LAce9VvrgHUdTf3rii0WS21cuvRHnUw0V-jwjdpLRIM64XBIAF4Ilfc-KnXTGLz82ESr0t0kGLBSwBaQ8KVAjA";
  final c = Client(token);
  await c.getPublic();
  await c.getSecured();
  await c.channel.shutdown();
}
