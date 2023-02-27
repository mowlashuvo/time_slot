import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import '../../widget/custom_navbar.dart';
import '../home/home_screen.dart';


class DashboardScreen extends StatelessWidget {


  const DashboardScreen({Key? key}) : super(key: key);

  static const String routeName = '/dashboard';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DashboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex=0;
    return BlocConsumer<BottomNavigationBarBloc, BottomNavigationBarState>(
      listener: (context, state) {
        selectedIndex = state.tabIndex;
      },
      builder: (context, state) {
        return Scaffold(
            // appBar: selectedIndex==2?null:CustomAppBar(title: selectedIndex==0?'Open 247':selectedIndex==1?'Cart':'Profile', index: selectedIndex),
            body: selectedIndex==0?const HomeScreen():selectedIndex==1?const HomeScreen():const HomeScreen(),
            bottomNavigationBar: CustomNavigationBar(selectedIndex: selectedIndex)
        );
      },
    );
  }
  Future<void> resetIsBackPressed(bool isBackPressed) async {
    await Future<void>.delayed(const Duration(seconds: 10));
    if(isBackPressed){
      isBackPressed = false;
    }
  }
}