import 'package:flutter/material.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key? key}) : super(key: key);

  @override
  _TournamentPageState createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Slide from above
      end: const Offset(0, 0), // Slide to the final position
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(75.0),
            child: Text(
              'TOURNAMENTS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 245, 243, 245),
              ),
            ),
          ),
          SlideTransition(
            position: _slideAnimation,
            child: Column(
              children: [
                GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(16),
                  childAspectRatio: 1.0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: () {
                        _showImageDialog(
                            context, getImagePath(index), getText(index));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 184, 49, 166),
                        ),
                        margin: const EdgeInsets.all(8),
                        child: Image.asset(
                          getImagePath(index),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getImagePath(int index) {
    // Define the image paths based on the index
    switch (index) {
      case 0:
        return 'asset/bgmi12.jpeg';
      case 1:
        return 'asset/chess.jpeg';
      case 2:
        return 'asset/coc.jpeg';
      case 3:
        return 'asset/scribble.jpeg';
      case 4:
        return 'asset/UNO.jpeg';
      case 5:
        return 'asset/pes12.jpg';
      case 6:
        return 'asset/meme.jpeg';
      case 7:
        return 'asset/reel.jpeg';
      case 8:
        return 'asset/photo.jpeg';
      default:
        return '';
    }
  }

  String getText(int index) {
    // Define the additional text based on the index
    switch (index) {
      case 0:
        return 'BGMI is an online multiplayer game. Winner gets chicken dinner!';
      case 1:
        return 'Chess is a game of mind and strategy';
      case 2:
        return 'COC is an online multiplayer game. Raid the village and gain!';
      case 3:
        return 'Skribble: Draw & Guess';
      case 4:
        return 'UNO: Draw your card';
      case 5:
        return 'PES: Best e-football there is';
      case 6:
        return 'Make the best meme';
      case 7:
        return 'Reel it, make it';
      case 8:
        return 'Click the best';
      default:
        return '';
    }
  }

  void _showImageDialog(BuildContext context, String imagePath, String additionalText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 186, 23, 137),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                additionalText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 240, 229), // Set the desired color
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
