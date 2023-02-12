import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/resources/app_color.dart';

class UserContainer extends StatefulWidget {
  final String name;
  final String number;
  final String insta_id;
  final String discord_id;
  const UserContainer(
      {Key? key,
      required this.name,
      required this.number,
      required this.insta_id,
      required this.discord_id})
      : super(key: key);

  @override
  State<UserContainer> createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: screenWidth * 0.2,
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          color: AppColor.secondaryTextColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 35),
              child: Container(
                // width: screenWidth * 0.6,
                child: Row(
                  children: [
                    Text(
                      'Name :',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: AppColor.primaryTextColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${widget.name}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: AppColor.secondaryTextColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13, left: 35),
              child: Container(
                // width: screenWidth * 0.6,
                child: Row(
                  children: [
                    Text(
                      'WhatsApp Number :',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: AppColor.primaryTextColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${widget.number}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: AppColor.secondaryTextColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13, left: 35),
              child: Container(
                // width: screenWidth * 0.6,
                child: Row(
                  children: [
                    Text(
                      'Discord Id :',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: AppColor.primaryTextColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${widget.discord_id}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: AppColor.secondaryTextColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
