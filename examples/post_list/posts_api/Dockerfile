FROM google/dart

ENV PUB_HOSTED_URL=https://pub.flutter-io.cn
ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
WORKDIR /post_list_grpc
COPY . /post_list_grpc
RUN rm -f .packages pubspec.lock
RUN pub get
ENTRYPOINT ["/usr/bin/dart", "lib/src/server.dart"]