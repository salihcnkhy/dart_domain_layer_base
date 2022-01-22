import 'package:domain_layer_base/interfaces/interface_use_case_listener.dart';

class MockUsecaseListener implements IUseCaseListener {
  @override
  void onPostExecute() {
    print("Listener Post Execute");
    // TODO: implement onPostExecute
  }

  @override
  void onPreExecute() {
    print("Listener Pre Execute");
    // TODO: implement onPreExecute
  }
}
