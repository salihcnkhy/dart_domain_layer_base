import 'package:data_layer_base/mock/mock_repository.dart';
import 'package:data_layer_base/mock/mock_request.dart';
import 'package:data_layer_base/mock/mock_response.dart';
import 'package:domain_layer_base/base/base_use_case.dart';
import 'package:domain_layer_base/interfaces/interface_use_case_listener.dart';

class MockUseCase
    extends SingleUseCase<MockRequest, MockResponse, MockRepository> {
  MockUseCase({required MockRepository repository, IUseCaseListener? listener})
      : super(repository: repository, listener: listener);

  @override
  Future<MockResponse> createUseCase(MockRequest request) {
    return repository.trySignIn(request);
  }
}
