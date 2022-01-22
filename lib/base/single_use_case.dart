import 'dart:async';

import 'package:domain_layer_base/interfaces/interface_use_case_listener.dart';

import 'base_use_case.dart';

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
