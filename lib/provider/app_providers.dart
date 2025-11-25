import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vf_app/screen/broadcast/provider/broadcast_provider.dart';
import 'package:vf_app/screen/drawerScreens/ourLeader/provider/our_leader_provider.dart';
import 'package:vf_app/screen/drawerScreens/partyWings/provider/partyWings_provider.dart';
import 'package:vf_app/screen/login/provider/login_provider.dart';
import 'package:vf_app/screen/splash/provider/splash_provider.dart';

class AppProviders{
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider(create: ((context) => SplashProvider())),
      ChangeNotifierProvider(create: ((context) => LoginProvider())),
      ChangeNotifierProvider(create: ((context) => BroadcastProvider())),
      ChangeNotifierProvider(create: ((context) => PartyWingsProvider())),
      ChangeNotifierProvider(create: ((context) => OurLeaderProvider())),


    ];
  }
}