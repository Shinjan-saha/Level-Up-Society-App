import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
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
      begin: const Offset(1, 0), // Slide from the right
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/body-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              SlideTransition(
                position: _slideAnimation,
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.white),
                  title: Text(
                    'Email',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'levelupsociety.collab@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SlideTransition(
                position: _slideAnimation,
                child: ListTile(
                  leading: Icon(Icons.location_on, color: Colors.white),
                  title: Text(
                    'Address',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Techno main Salt lake,Sec-v.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
