import 'package:flutter/material.dart';
import 'package:medishop/screens/home.dart';
import 'package:medishop/screens/product_catalogue.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const Home(),
    Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const ProductCatalogue(),
        );
      },
    ),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.4),
              width: 1.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromRGBO(71, 53, 255, 1),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                _currentIndex == 0
                    ? 'assets/icons/home_selected.png'
                    : 'assets/icons/home_unselected.png',
                width: 20,
                height: 20,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _currentIndex == 1
                    ? 'assets/icons/catalog_selected.png'
                    : 'assets/icons/catalog_unselected.png',
                width: 20,
                height: 20,
              ),
              label: 'Catalog',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _currentIndex == 2
                    ? 'assets/icons/cart_selected.png'
                    : 'assets/icons/cart_unselected.png',
                width: 20,
                height: 20,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _currentIndex == 3
                    ? 'assets/icons/profile_selected.png'
                    : 'assets/icons/profile_unselected.png',
                width: 20,
                height: 20,
              ),
              label: 'My Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder screens for demonstration purposes

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Cart Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Screen'));
  }
}
