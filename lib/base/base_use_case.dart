import 'dart:async';

import 'package:domain_layer_base/interfaces/interface_use_case_listener.dart';

abstract class BaseUseCase<Request, Response, Repository> {
  final IUseCaseListener? _useCaseListener;
  final Repository repository;
  BaseUseCase({required this.repository, IUseCaseListener? listener})
      : _useCaseListener = listener;

  void onPreExecute() {
    _useCaseListener?.onPreExecute();
  }

  void onPostExecute() {
    _useCaseListener?.onPostExecute();
  }

  Future<Response> createUseCase(Request request);
}

abstract class SingleUseCase<Request, Response, Repository>
    extends BaseUseCase<Request, Response, Repository> {
  SingleUseCase({required Repository repository, IUseCaseListener? listener})
      : super(repository: repository, listener: listener);

  Future<Response?> execute(Request request) async {
    onPreExecute();
    final completer = Completer<Response>();
    await createUseCase(request)
        .then((value) => completer.complete(value))
        .catchError((error) {
      completer.complete(null);
      return null;
    });
    onPostExecute();
    return completer.future;
  }
}
