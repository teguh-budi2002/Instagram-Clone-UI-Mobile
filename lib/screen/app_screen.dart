import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constrant.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final List<Uint8List> _imagesPost = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/randomimage?category=nature'),
        headers: {
          "Accept": "image/jpg",
          "X-Api-Key": "S0ehoPKjy8EKYJ7O2yx6Bg==bgkRV7QYSVgOG7Hl"
        },
      );

      if (response.statusCode == 200) {
        for (var i = 0; i < 5; i++) {
          _imagesPost.add(response.bodyBytes);
        }
        setState(() {
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const Text(
                        "teguhbudiii",
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        "assets/icons/add-icon.svg",
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        "assets/icons/menu.svg",
                        width: 18,
                        height: 18,
                      )
                    ],
                  ),
                ),
              ),
              const Divider(height: 1),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/avatar.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            "59",
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Posts",
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            "111.4K",
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            "2",
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "teguh budbud",
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Halo, nama saya Teguh Budi Laksono",
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                  ),
                ),
              ),
              // const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Transform.rotate(
                      angle: 15,
                      child: Image.asset(
                        "assets/icons/hyperlink-icon.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 1),
                    const Text(
                      "guhcoding.com/",
                      style: TextStyle(
                        color: hyperlinkColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    ProfileButton(text: "Edit Profile"),
                    SizedBox(width: 8),
                    ProfileButton(text: "Share Profile"),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    ProfileButton(text: "Insights"),
                    SizedBox(width: 8),
                    ProfileButton(text: "Add Shop"),
                    SizedBox(width: 8),
                    ProfileButton(text: "Contact"),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Highlight(
                      text: "Pantai Bali",
                      uriImage: "assets/images/highlight-1.jpg",
                    ),
                    const SizedBox(width: 10),
                    const Highlight(
                      text: "Wisata Batu",
                      uriImage: "assets/images/highlight-2.jpg",
                    ),
                    const SizedBox(width: 10),
                    const Highlight(
                      text: "Surabaya",
                      uriImage: "assets/images/highlight-3.jpg",
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                            height: 80,
                            width: 80,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: secondaryColor,
                                ),
                                borderRadius: BorderRadius.circular(80)),
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            )),
                        const SizedBox(height: 4),
                        const Text("New")
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: black)),
                      ),
                      child: const Center(
                        child: Icon(Icons.grid_4x4_outlined),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/instagramreels-icon.svg",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: Center(
                        child: Image.asset(
                          "assets/icons/user-icon.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              isLoading
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: _imagesPost.length,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(_imagesPost[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        backgroundColor: white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home_outlined,
              color: black,
            ),
          ),
          const BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              "assets/icons/add-icon.svg",
              width: 18,
              height: 18,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              "assets/icons/instagramreels-icon.svg",
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/avatar.jpg",
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Highlight extends StatelessWidget {
  const Highlight({
    super.key,
    required this.text,
    required this.uriImage,
  });
  final String text;
  final String uriImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              border: Border.all(
                color: secondaryColor,
              ),
              borderRadius: BorderRadius.circular(80)),
          child: ClipOval(
            child: Image.asset(
              uriImage,
              width: 80,
              height: 80,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(text)
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: buttonDecoration,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
