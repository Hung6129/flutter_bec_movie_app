import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'screens/favoritepage/favorite_page.dart';
import 'screens/homepage/homepage.dart';
import 'screens/notification/notification_page.dart';
import 'screens/profile/profile_page.dart';
import 'widgets/constrant.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const HomePage(),
        const FavoritePage(),
        const NotificationPage(),
        const ProfilePage(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: Constrant.p7,
          inactiveColorPrimary: Constrant.p7.withOpacity(0.2),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.square_favorites),
          title: ("Favorite"),
          activeColorPrimary: Constrant.p7,
          inactiveColorPrimary: Constrant.p7.withOpacity(0.2),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.bell_solid),
          title: ("Notification"),
          activeColorPrimary: Constrant.p7,
          inactiveColorPrimary: Constrant.p7.withOpacity(0.2),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.profile_circled),
          title: ("Profile"),
          activeColorPrimary: Constrant.p7,
          inactiveColorPrimary: Constrant.p7.withOpacity(0.2),
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),

      confineInSafeArea: true,
      backgroundColor: Constrant.p8, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
