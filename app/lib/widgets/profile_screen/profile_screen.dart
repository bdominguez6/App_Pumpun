import 'package:app/data/dummy/dummy_bryan.dart';
import 'package:app/widgets/profile_screen/styled_text.dart';
import 'package:app/widgets/profile_screen/user_data.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/profile_screen/last_liked.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    DummyBryan dummy = DummyBryan();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Fondo transparente
        elevation: 0, // Deshabilitar el sombreado
        leading: Container(
          margin: const EdgeInsets.all(10),
          height: 32,
          width: 32,
          child: Image.asset('assets/images/icons/icon_64px.png'),
        ),
        title: Title(
          color: Colors.black,
          child: Text(
            'Discover Books',
            // style: GoogleFonts.lato(
            //   color: Colors.white,
            //   fontSize: 24,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
        ),
        titleSpacing: 0,
      ),
      // 
      body: Column(
        children: [
          SizedBox(height: screenHeight / 40),
          UserData(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            user: dummy.userDummy!,
          ),
          SizedBox(height: screenHeight / 40),
          Container(
            width: screenWidth / 20 * 19,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StyledText(
                  text: 'Last Liked',
                  fontSize: screenHeight / 25,
                ),
                TextButton(
                  style: const ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(Colors.amber)),
                  onPressed: () {},
                  child: StyledText(
                    text: 'More...',
                    fontSize: screenHeight / 50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight / 45),
          LastLiked(
            width: screenWidth / 20 * 19,
            height: screenHeight / 10 * 4,
            user: dummy.userDummy!,
          ),
        ],
      ),
    );
  }
}
