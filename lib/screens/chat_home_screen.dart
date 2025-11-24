import 'package:flutter/material.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B141A),

      // ================= APP BAR =================
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Jam dan titik tiga
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "19.05",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.more_horiz, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Judul + Camera + Add
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Chat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff202C33),
                          ),
                          child: const Icon(Icons.camera_alt,
                              color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 12),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ================= BODY =================
      body: Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff202C33),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white54),
                  hintText: "Cari",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // FILTER BUTTONS + PLUS ICON
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              children: [
                filterChip("Semua", true),
                filterChip("Belum dibaca 11", false),
                filterChip("Favorit", false),
                Row(
                  children: [
                    filterChip("Grup 4", false),
                    const SizedBox(width: 4),
                    const CircleAvatar(
                      radius: 13,
                      backgroundColor: Color(0xff202C33),
                      child: Icon(Icons.add, size: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Diarsipkan
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 6),
            child: Row(
              children: const [
                Icon(Icons.archive, color: Colors.white70),
                SizedBox(width: 10),
                Text(
                  "Diarsipkan",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),

          // ================= CHAT LIST =================
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 80),
              children: [
                chatTile(
                    name: "Putra Alif",
                    message: "lagi dimana?",
                    time: "19.20",
                    imagePath: "assets/images/putra.jpg",
                    unread: 2,
                    delivered: true),
                chatTile(
                    name: "Salsa",
                    message: "iyaaa besok ya",
                    time: "18.55",
                    imagePath: "assets/images/salsa.jpg",
                    unread: 1),
                chatTile(
                    name: "Dewi",
                    message: "udah aku kirim fotonya",
                    time: "18.20",
                    delivered: true,
                    unread: 3,
                    imagePath: "assets/images/dewi.jpg"),
                chatTile(
                    name: "Fajar",
                    message: "otw rumah",
                    time: "17.40",
                    imagePath: "assets/images/fajar.jpg"),
                chatTile(
                    name: "Nadya",
                    message: "bsk jadi kan?",
                    time: "17.15",
                    unread: 1,
                    imagePath: "assets/images/nadya.jpg"),
                chatTile(
                    name: "Adit",
                    message: "okeh siap",
                    time: "16.50",
                    imagePath: "assets/images/adit.jpg"),
                chatTile(
                    name: "Rizka",
                    message: "mana tugasnyaa",
                    time: "16.02",
                    unread: 5,
                    imagePath: "assets/images/rizka.jpg"),
                chatTile(
                    name: "Bagas",
                    message: "makasih yaa",
                    time: "15.33",
                    imagePath: "assets/images/bagas.jpg"),
              ],
            ),
          ),
        ],
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff0B141A),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Pembaruan"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Panggilan"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Komunitas"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Pengaturan"),
        ],
      ),
    );
  }

  // ============================================================
  // COMPONENT: FILTER CHIP
  // ============================================================
  Widget filterChip(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active ? Colors.green : const Color(0xff202C33),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: TextStyle(color: active ? Colors.white : Colors.white70),
      ),
    );
  }

  // ============================================================
  // COMPONENT: CHAT TILE
  // ============================================================
  Widget chatTile({
    required String name,
    required String message,
    required String time,
    String? imageUrl,
    String? imagePath,
    String? initials,
    bool delivered = false,
    bool pinned = false,
    int unread = 0,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.grey,
        backgroundImage: imagePath != null
            ? AssetImage(imagePath)
            : (imageUrl != null ? NetworkImage(imageUrl) : null),
      ),
      title: Text(name,
          style: const TextStyle(color: Colors.white, fontSize: 17)),
      subtitle: Row(
        children: [
          if (delivered)
            const Icon(Icons.done_all, color: Colors.blue, size: 18),
          if (delivered) const SizedBox(width: 4),
          Text(
            message,
            style: const TextStyle(color: Colors.white60),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: Column(
        children: [
          Text(time,
              style: const TextStyle(color: Colors.white70, fontSize: 13)),
          if (unread > 0)
            Container(
              margin: const EdgeInsets.only(top: 6),
              padding: const EdgeInsets.all(6),
              decoration:
                  const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child: Text(unread.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
        ],
      ),
    );
  }
}