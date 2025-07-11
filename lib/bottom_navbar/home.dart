import 'package:flutter/material.dart';
import 'package:project_1/category.dart';
import 'package:project_1/friedrice.dart';
import 'package:project_1/sushi.dart';
import 'package:project_1/premium/premium.dart';
import 'package:project_1/recipe_data.dart';
import 'package:project_1/dynamic_page.dart';
import 'package:project_1/pizza.dart';
import 'package:project_1/login.dart';
import 'package:project_1/statistic.dart';
import 'package:project_1/category.dart';
import 'package:project_1/setting/setting.dart';
import 'package:project_1/messages.dart';
import 'account.dart';
import 'package:project_1/faq.dart';
import 'package:project_1/burger.dart';

class MenuItem {
  final int id;
  final String label;
  final IconData icon;

  MenuItem(this.id, this.label, this.icon);
}

List<MenuItem> menuItems = [
  MenuItem(1, 'Sushi', Icons.ramen_dining),
  MenuItem(2, 'Pizza', Icons.local_pizza),
  MenuItem(3, 'Burger', Icons.fastfood),
  MenuItem(4, 'Fried Rice', Icons.rice_bowl),
];

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  String selectedPage = '';
  MenuItem? selectedMenu;
  final TextEditingController menuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Patrick',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 2),
            Text(
              'What would you like to cook today?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('profile.jpg'),
              radius: 18,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownMenu<MenuItem>(
              controller: menuController,
              hintText: "Select Menu",
              requestFocusOnTap: true,
              enableFilter: true,
              label: const Text('Select Menu'),
              onSelected: (MenuItem? menu) {
                setState(() {
                  selectedMenu = menu;
                  if (menu?.label == 'Sushi') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Sushi()),
                    );
                  }
                  if (menu?.label == 'Pizza') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Pizza()),
                    );
                  }
                  if (menu?.label == 'Burger') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Burger()),
                    );
                  }
                  if (menu?.label == 'Fried Rice') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FriedRice(),
                      ),
                    );
                  }
                });
              },
              dropdownMenuEntries:
                  menuItems.map((MenuItem menu) {
                    return DropdownMenuEntry<MenuItem>(
                      value: menu,
                      label: menu.label,
                      leadingIcon: Icon(menu.icon),
                    );
                  }).toList(),
            ),
          ),
        ),
      ),

      /// 🔷 Custom Drawer with Profile Info
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('profile.jpg'),
              ),
              accountName: const Text(
                'Patrick',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text('UserID: 1230133'),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MessagingHome()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Account()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Setting()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Statistik Resep'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const RecipeStatPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Premium'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const PremiumPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('FAQ'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const FAQPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _CategoryItem(
                      icon: Icons.free_breakfast,
                      label: 'Breakfast',
                      onTapPage:
                          () => CategoryRecipePage(
                            categoryTitle: 'Breakfast',
                            recipes: breakfastRecipes,
                          ),
                    ),
                    _CategoryItem(
                      icon: Icons.lunch_dining,
                      label: 'Lunch',
                      onTapPage:
                          () => CategoryRecipePage(
                            categoryTitle: 'Lunch',
                            recipes: lunchRecipes,
                          ),
                    ),
                    _CategoryItem(
                      icon: Icons.dinner_dining,
                      label: 'Dinner',
                      onTapPage:
                          () => CategoryRecipePage(
                            categoryTitle: 'Dinner',
                            recipes: dinnerRecipes,
                          ),
                    ),
                    _CategoryItem(
                      icon: Icons.icecream,
                      label: 'Dessert',
                      onTapPage:
                          () => CategoryRecipePage(
                            categoryTitle: 'Desserts',
                            recipes: dessertRecipes,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Go Premium',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Unlock exclusive features and elevate your experience!',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PremiumPage(),
                            ),
                          );
                        },
                        child: const Text('Unlock Now'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Discover Recipe",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _ImageCard('food1.jpg', 'Sushi', () => Sushi()),
                      const SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi', () => Sushi()),
                      const SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi', () => Sushi()),
                      const SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi', () => Sushi()),
                      const SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi', () => Sushi()),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Newest Recipe",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _ImageCard('food3.jpg', 'Burger', () => Burger()),
                      const SizedBox(width: 12),
                      _ImageCard('food2.jpeg', 'Pizza', () => Pizza()),
                      const SizedBox(width: 12),
                      _ImageCard('food4.jpg', 'Fried Rice', () => FriedRice()),
                      const SizedBox(width: 12),
                      ...userRecipes.map(
                        (recipe) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _ImageCard(
                            recipe.imagePath,
                            recipe.title,
                            () => DynamicRecipePage(recipe: recipe),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget Function() onTapPage;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.onTapPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => onTapPage()),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.orange.shade100,
            child: Icon(icon, size: 28, color: Colors.deepOrange),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String imagePath;
  final String caption;
  final Widget Function() onTapPage;

  const _ImageCard(this.imagePath, this.caption, this.onTapPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => onTapPage()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            caption,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
