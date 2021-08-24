import 'package:flutter/material.dart';
import 'package:shamo_app_flutter/pages/home/chat_page.dart';
import 'package:shamo_app_flutter/pages/home/home_page.dart';
import 'package:shamo_app_flutter/pages/home/profile_page.dart';
import 'package:shamo_app_flutter/pages/home/wishlist_page.dart';
import 'package:shamo_app_flutter/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20,
      ),
    );
  }

  Widget body() {
    switch (_currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return ChatPage();
      case 2:
        return WishlistPage();
      case 3:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  Widget customBottomNav() {
    return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          color: bgColor4,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              enableFeedback: false,
              backgroundColor: bgColor4,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    label: "",
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_home.png',
                        color: _currentIndex == 0
                            ? primaryColor
                            : Color(0xff808191),
                        width: 21,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10, right: 60),
                      child: Image.asset(
                        'assets/icon_chat.png',
                        width: 21,
                        color: _currentIndex == 1
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10, left: 60),
                      child: Image.asset(
                        'assets/love_gray.png',
                        width: 21,
                        color: _currentIndex == 2
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_account.png',
                        width: 21,
                        color: _currentIndex == 3
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    )),
              ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: customBottomNav(),
      ),
      body: body(),
    );
  }
}
