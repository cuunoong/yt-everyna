import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fly/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: bottomNavigationBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(children: [
          background(),
          main(),
        ]),
      )),
    );
  }

  Widget main() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Column(
        children: [
          header(),
          const SizedBox(
            height: 20,
          ),
          menus(),
          const SizedBox(
            height: 20,
          ),
          searchBox(),
          const SizedBox(
            height: 20,
          ),
          flightOptions()
        ],
      ),
    );
  }

  Positioned background() {
    return Positioned.fill(
      top: 400,
      bottom: 0,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: gray1)),
          color: const Color(0xFFF9F9F9),
        ),
      ),
    );
  }

  Widget flightOptions() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => flightOption(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
        itemCount: 8);
  }

  Container flightOption() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(6), color: white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              flightTime(time: "09:00", dest: "CKG"),
              const SizedBox(
                width: 6,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 18,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/svgs/dot.svg"),
                            Flexible(
                                child: DottedLine(
                              dashColor: gray,
                            )),
                            Transform.rotate(
                              angle: -67.5,
                              child: SvgPicture.asset("assets/svgs/flight.svg",
                                  colorFilter:
                                      ColorFilter.mode(gray, BlendMode.srcIn)),
                            ),
                            Flexible(
                                child: DottedLine(
                              dashColor: gray,
                            )),
                            SvgPicture.asset("assets/svgs/dot.svg")
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "1h 35m",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: gray),
                      )
                    ],
                  )),
              const SizedBox(
                width: 6,
              ),
              flightTime(time: "10:35", dest: "SUB")
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    border: Border.all(color: gray1),
                    borderRadius: BorderRadius.circular(6)),
                child: Center(child: SvgPicture.asset("assets/svgs/logo.svg")),
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Naana",
                          style: GoogleFonts.inter(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          children: const [
                        TextSpan(
                            text: "Fly",
                            style: TextStyle(color: Color(0xFFE56F8C)))
                      ])),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "\$125",
                          style: GoogleFonts.inter(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                          children: [
                        TextSpan(
                            text: " /person",
                            style: TextStyle(
                                color: gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 12))
                      ])),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/svgs/utensils.svg",
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(
                "assets/svgs/briefcase.svg",
                width: 20,
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }

  Column flightTime({required String time, required String dest}) {
    return Column(
      children: [
        Text(
          time,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.bold, fontSize: 20, color: black),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          dest,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500, fontSize: 14, color: gray),
        )
      ],
    );
  }

  Container searchBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: white,
          border: Border.all(color: gray1)),
      child: Column(
        children: [
          tabs(),
          const SizedBox(
            height: 16,
          ),
          input(
              placeholder: "From",
              icon: "location.svg",
              value: "Jakarta (JKTA)"),
          const SizedBox(
            height: 16,
          ),
          input(
              placeholder: "To", icon: "location.svg", value: "Surabaya (SUB)"),
          const SizedBox(
            height: 16,
          ),
          input(
              placeholder: "Depature Date",
              icon: "calendar.svg",
              value: "Saturday, 17 Dec 2023"),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: input(
                    placeholder: "Passangers",
                    icon: "person.svg",
                    value: "2 passanger(s)"),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                flex: 1,
                child: input(
                    placeholder: "Seat Class",
                    icon: "sheat.svg",
                    value: "Economy"),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              // TODO: On search tap
            },
            child: Container(
              width: double.maxFinite,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10.5),
              decoration: BoxDecoration(
                  color: primary.withOpacity(.1),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: Text(
                  "Search",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: primary),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget input(
      {required String placeholder,
      required String icon,
      required String value}) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            placeholder,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500, fontSize: 12, color: gray),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/svgs/$icon',
                  width: 18,
                  height: 18,
                  colorFilter: ColorFilter.mode(black, BlendMode.srcIn)),
              const SizedBox(
                width: 3,
              ),
              Text(
                value,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 12, color: black),
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }

  Row tabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        tab(text: "One-way", isActive: true),
        tab(text: "Multi-city"),
      ],
    );
  }

  GestureDetector tab(
      {Function? onTap, required String text, bool isActive = false}) {
    return GestureDetector(
      onTap: onTap != null ? onTap() : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: isActive ? primary : null,
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          text,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: isActive ? white : primary),
        ),
      ),
    );
  }

  Row menus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        menu(title: "Hotels", icon: "hotel.svg"),
        menu(title: "Flight", icon: "flight.svg", isActive: true),
        menu(title: "Trains", icon: "train.svg"),
        menu(title: "Ship", icon: "ship.svg"),
        menu(title: "Shuttle", icon: "shuttle.svg")
      ],
    );
  }

  Column menu(
      {required String icon, required String title, bool isActive = false}) {
    return Column(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: !isActive ? Border.all(color: gray1) : null,
              color: isActive ? primary : null),
          child: Center(
            child: SvgPicture.asset('assets/svgs/$icon',
                colorFilter: ColorFilter.mode(
                    isActive ? white : black1, BlendMode.srcIn)),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          title,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: isActive ? primary : black1),
        )
      ],
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Location",
              style: GoogleFonts.inter(fontSize: 12, color: gray),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/svgs/location.svg',
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(black, BlendMode.srcIn)),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "Buitenzorg, Indonesia",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 12, color: black),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          width: 24,
        ),
        Image.asset(
          'assets/images/profile.png',
        )
      ],
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xFFD4D4D4).withOpacity(0.12),
          spreadRadius: 0,
          blurRadius: 25,
          offset: const Offset(0, -8),
        )
      ], color: white),
      child: Row(
        children: [
          bottomNavigationBarItem(
              icon: "compas.svg", label: "Explore", isActive: true),
          bottomNavigationBarItem(icon: "search.svg", label: "Search"),
          bottomNavigationBarItem(icon: "document.svg", label: "Booking"),
          bottomNavigationBarItem(icon: "chat.svg", label: "Inbox"),
        ],
      ),
    );
  }

  Widget bottomNavigationBarItem(
      {required String icon, required String label, bool isActive = false}) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/svgs/$icon",
            colorFilter:
                ColorFilter.mode(isActive ? primary : black1, BlendMode.srcIn),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: GoogleFonts.inter(
                color: isActive ? primary : black1, fontSize: 12),
          )
        ],
      ),
    );
  }
}
