import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:travel_book/screens/dashboard/notifications.dart';
import 'package:travel_book/screens/dashboard/saved.dart';
import '../../extras/colors.dart';
import 'home_page.dart';
import 'profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(_selectedPage == 0){
          return Future.value(true);
        }else{
          setState(() {
            _selectedPage = 0;
          });
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: _selectedPage != 1 ?  Colors.white : Colors.grey[50],
        bottomNavigationBar: bottomNavigationBar(),
        body: SafeArea(child: pages[_selectedPage],),
      ),
    );
  }

  int _selectedPage = 0;
  void _selectPage(int index){
    // if(index == 3){
    //   context.push(child: const SignIn());
    //   return;
    // }
    setState(() {
      _selectedPage = index;
    });
  }
  List<Widget> pages = [
    HomePage() ,
    const Saved(),
  // if(provider.notif.isNotEmpty)...[
  // NewsWidget(model: provider.news.first,),
    Notifications(),
    const Profile(),
  ];
  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _selectPage,
      backgroundColor: Colors.white,
      unselectedItemColor: CColors.grey3,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedPage,
      type: BottomNavigationBarType.fixed,
      items: [
        bottomNavigationBarItem(_selectedPage == 0 ? IconlyBold.home : IconlyLight.home,),
        bottomNavigationBarItem(_selectedPage == 1 ? IconlyBold.bookmark : IconlyLight.bookmark,),
        bottomNavigationBarItem(_selectedPage == 2 ? IconlyBold.notification : IconlyLight.notification,),
        bottomNavigationBarItem(_selectedPage == 3 ? IconlyBold.profile : IconlyLight.profile,),
      ],
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), label: "",);
  }


}
