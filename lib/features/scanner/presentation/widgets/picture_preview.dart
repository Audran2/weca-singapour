import 'dart:io';
import 'package:flutter/material.dart';

class PicturePreview extends StatelessWidget {
  final File image;
  final Function(File file)
      handleRemove; // Il faut que ce soit une fonction qui ne prend pas d'argument

  const PicturePreview(
      {super.key, required this.image, required this.handleRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8), // Coins arrondis
          child: Image.file(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () {
              handleRemove(this.image);
            }, // Appelle la fonction pour supprimer l'image
            child: CircleAvatar(
              backgroundColor:
                  Colors.black.withOpacity(0.5), // Fond semi-transparent
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
