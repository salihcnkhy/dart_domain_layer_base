import 'package:data_layer_base/mock/mock_api_remote.dart';
import 'package:data_layer_base/mock/mock_repository.dart';
import 'package:data_layer_base/mock/mock_request.dart';
import 'package:data_layer_base/mock/mock_service_provider.dart';
import 'package:domain_layer_base/mock/mock_listener.dart';
import 'package:domain_layer_base/mock/mock_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final serviceProvider = MockServiceProviderManager();
  final apiRemote = MockApiRemote(serviceProvider);
  final repository = MockRepository(apiRemote);
  final listener = MockUsecaseListener();
  final useCase = MockUseCase(repository: repository, listener: listener);
  final request = MockRequest(email: "test@test.com", password: "123456");
  test('success response', () async {
    final data = await useCase.execute(request);
    expect(true, data.isSuccess);
    print(data);
  });
}
