import 'dart:math';

import 'package:flutter/material.dart';

class CountController extends ChangeNotifier{
  List<int> numbers = [];
  // List<int> 
  generateAndShuffleNumbers(int number) {
    // List<int> numbers = [number];
    numbers.add(number);
    Random random = Random();

    // Generate 3 random numbers and add them to the list
    while (numbers.length < 4) {
      int randomNumber = random.nextInt(9) + 1; // Generates a random number between 1 and 100
      if (!numbers.contains(randomNumber)) {
        numbers.add(randomNumber);
      }
    }

    // Shuffle the list
    numbers.shuffle();

    // return numbers;
  }
}