import 'package:flutter/material.dart';

class RankPage extends StatelessWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/body-bg.jpg'), // Replace with your own image path
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LeaderBoard',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 243, 245),),
                  

                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    _buildRankBox('BGMI', '1st Rank', ['Player ', 'Player ', 'Player ']),
                    SizedBox(height: 20),
                    _buildRankBox('PES', '2nd Rank', ['Player ', 'Player ', 'Player ']),
                    SizedBox(height: 20),
                    _buildRankBox('CHESS', '3rd Rank', ['Payel Chaudhari', 'Roshan Hari', 'Shashank Shekhar']),
                    SizedBox(height: 20),
                    _buildRankBox('COC', '1st Rank', ['Amit Kumar', 'Rohit Kumar Prasad', 'Minhaz Quashi']),
                    SizedBox(height: 20),
                    _buildRankBox('UNO', '2nd Rank', ['Player ', 'Player ', 'Player ']),
                    SizedBox(height: 20),
                    _buildRankBox('SCRIBBLE', '3rd Rank', ['Arnab Gupta', 'Atul Singh', 'Debanjan']),
                    SizedBox(height: 20),
                    _buildRankBox('MEME', '1st Rank', ['Arnab Gupta', 'Nikhil Kumar', 'Niket']),
                    SizedBox(height: 20),
                    _buildRankBox('REEL', '2nd Rank', ['Arnab Gupta']),
                    SizedBox(height: 20),
                    _buildRankBox('PHOTOGRAPHY', '3rd Rank', ['Sougata']),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRankBox(String game, String rank, List<String> players) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 252, 3, 202),
      ),
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            game,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Column(
            children: players
                .map(
                  (player) => Container(
                    padding: EdgeInsets.all(8),
                    color: Color.fromARGB(255, 230, 246, 4),
                    child: Text(
                      player,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
