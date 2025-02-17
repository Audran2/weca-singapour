import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/modal/modal_bottom_sheet.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: Image.network(
              'https://images-platform.99static.com/lnz3Ev1acDg9WGpjnv2-CQGK52g=/0x0:2000x2000/500x500/top/smart/99designs-contests-attachments/127/127533/attachment_127533869',
              fit: BoxFit.cover,
            ),
          ),
          ModalBottomSheet(body: _modalBody(),),
        ],
      ),
    );
  }

  Widget _modalBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tag "Vegetarian"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.pink[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //TODO add icons in assets
                SvgPicture.asset(
                  'assets/icons/vegetarian.svg',
                  width: 16,
                  height: 16,
                  color: Colors.pink.shade700,
                ),
                const SizedBox(width: 4),
                Text(
                  "Vegetarian",
                  style: TextStyle(color: Colors.pink.shade700, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Title
          const Text(
            "Orange juice",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Rating & Allergen info
          Row(
            children: [
              const Icon(Icons.star_border, color: Colors.pink),
              const SizedBox(width: 4),
              Text(
                "80/100 Rating",
                style: TextStyle(color: Colors.pink.shade700, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.health_and_safety, color: Colors.pink),
              const SizedBox(width: 4),
              Text(
                "Allergen free",
                style: TextStyle(color: Colors.pink.shade700, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Additives / Warning
          Row(
            children: [
              _buildTag("E621", Icons.info, Colors.purple),
              const SizedBox(width: 8),
              _buildTag("Nitrite", Icons.warning, Colors.purple),
            ],
          ),
          const SizedBox(height: 16),

          // Ingredients
          const Text(
            "Ingredients:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text("- Orange\n- Sugar\n- Water", style: TextStyle(fontSize: 16)),

          const SizedBox(height: 16),

          // Description
          const Text(
            "Description:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit "
                "excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua "
                "ad duis eu laborum.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
