
import 'package:internet_connection_checker/internet_connection_checker.dart';
abstract class NetWorkInfo{
  Future<bool> get isConnected;
}
class NetWorkInfoImpl implements NetWorkInfo{
 final InternetConnectionChecker? internetConnectionChecker;
  NetWorkInfoImpl({this.internetConnectionChecker});

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => internetConnectionChecker!.hasConnection;

}