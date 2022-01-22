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


