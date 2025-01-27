import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(BirthdayApp());
}

class BirthdayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
      ),
      home: BirthdayScreen(),
    );
  }
}

class BirthdayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.orangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "🎉 Happy Birthday Meghana! 🎂",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "Wishing you a day filled with joy, laughter, \nand everything you love! 💖",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MemoryLaneScreen()),
                    );
                  },
                  icon: Icon(Icons.photo_album),
                  label: Text("View Memories"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BalloonsGameScreen()),
                    );
                  },
                  icon: Icon(Icons.gamepad),
                  label: Text("Pop the Balloons"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessageScreen()),
                    );
                  },
                  icon: Icon(Icons.message),
                  label: Text("Read My Message"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MemoryLaneScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'asset/images/P1.jpg',
    'asset/images/P2.jpg',
    'asset/images/P3.jpg',
    'asset/images/P4.jpg',
  ];

  final String backgroundImage = 'asset/images/P5.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memory Lane"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Stack(
        children: [
          // Background Image with reduced visibility
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
            ),
          ),
          // Overlay Content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Centers the content vertically
              children: [
                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: imagePaths.map((path) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BalloonsGameScreen extends StatefulWidget {
  @override
  _BalloonsGameScreenState createState() => _BalloonsGameScreenState();
}

class _BalloonsGameScreenState extends State<BalloonsGameScreen> {
  List<String> messages = [
    "In this journey of life, may you continue to find meaning in each moment and wisdom in every experience.",
    "With every passing year, you become more of who you're meant to be. Here's to that continuous growth.",
    "Not just today, but every day, I hope you find peace and fulfillment in all that you do.",
    "True happiness comes not from what we have, but in how we perceive the world and the choices we make. May this year offer you both.",
    "As you celebrate today, may you be reminded of how much you've already accomplished and how much potential still lies ahead.",
    "A year older, but not just in age—may you continue to evolve with grace, wisdom, and resilience.",
    "Time moves on, but wisdom and character are what truly shape us. Here's to another year of adding to that foundation.",
    "Every year offers a new chapter, and your story continues to be inspiring and impactful.",
    "May this year provide you with the clarity to understand your true purpose and the courage to chase it.",
    "You don't need to be the loudest voice in the room to make an impact. Your presence speaks volumes, and it matters more than you'll ever know."
  ];

  String displayedMessage = "Pop a balloon for a surprise message!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pop the Balloons 🎈"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orangeAccent, Colors.pinkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  displayedMessage,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          displayedMessage = messages[index];
                        });
                      },
                      child: Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "🎈",
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A Message for You"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Dear Meghana,\n\nHappy Birthday! 🥳"
            "Here’s to many more beautiful moments and unforgettable memories together! "
            "Have the best day ever! 💖\n\n- Pradeep",
            style: TextStyle(fontSize: 18, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
