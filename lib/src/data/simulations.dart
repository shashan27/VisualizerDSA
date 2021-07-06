import 'package:flutter/material.dart';
import 'package:visualizer/src/custom_items/simulation_card.dart';
import 'package:visualizer/src/data/themedata.dart';
import 'package:visualizer/src/simulations/FresherApp_card.dart';
import 'package:visualizer/src/simulations/backtracking_card.dart';
import 'package:visualizer/src/simulations/bubble_sort.dart';
import 'package:visualizer/src/simulations/selection_sort.dart';
import 'package:visualizer/src/simulations/toothpick.dart';
import 'package:visualizer/src/simulations/insertion_sort.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Simulations with ChangeNotifier {
  static var _favorites = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
  final _algorithm = [0, 1, 2, 4];
  final _others = [5, 3];
  var prefs;
  final _searchTags = {
    0: "bubble sort algorithm sorting bars ",
    1: "insertion sort algorithm sorting bars ",
    2: "selection sort algorithm sorting bars ",
    3: "toothpick pattern algorithm sequence ",
    4: "backtracking sudoku ",
    5: "freshers' app ",
  };

  Simulations() {
    getFavorites();
  }

  getFavorites() async {
    prefs = await SharedPreferences.getInstance();
    List<String> myList = (prefs.getStringList('favorites') ?? List<String>());
    if (myList.length != 0) {
      _favorites = myList.map((i) => int.parse(i)).toList();
      if (allSimulations().length > _favorites.length) {
        _favorites = List.from(_favorites)
          ..addAll(
              List.filled(allSimulations().length - _favorites.length, -1));
      }
    }
  }

  List<Widget> allSimulations() {
    final theme = ThemeProvider(prefs);
    return <Widget>[
      SimulationCard(
        id: 0,
        simulationName: 'Bubble Sort',
        image: theme.darkTheme
            ? 'assets/simulations/BubbleSortDark.png'
            : 'assets/simulations/BubbleSortLight.png',
        direct: BubbleSortBars(),
        infoLink: 'https://en.wikipedia.org/wiki/Bubble_sort',
        fav: _favorites[1],
      ),
      SimulationCard(
        id: 1,
        simulationName: 'Insertion Sort',
        image: theme.darkTheme
            ? 'assets/simulations/InsertionSortDark.png'
            : 'assets/simulations/InsertionSortLight.png',
        direct: InsertionHome(),
        infoLink: 'https://en.wikipedia.org/wiki/Insertion_sort',
        fav: _favorites[2],
      ),
      SimulationCard(
        id: 2,
        simulationName: 'Selection Sort',
        image: theme.darkTheme
            ? 'assets/simulations/InsertionSortDark.png'
            : 'assets/simulations/InsertionSortLight.png',
        direct: SelectionSortBars(),
        infoLink: 'https://en.wikipedia.org/wiki/Selection_sort',
        fav: _favorites[3],
      ),
      SimulationCard(
        id: 3,
        simulationName: 'Toothpick Pattern',
        image: theme.darkTheme
            ? 'assets/simulations/ToothpickPatternDark.png'
            : 'assets/simulations/ToothpickPatternLight.png',
        direct: ToothpickPattern(),
        infoLink: 'https://en.wikipedia.org/wiki/Toothpick_sequence',
        fav: _favorites[0],
      ),
      SimulationCard(
        id: 4,
        simulationName: 'Backtracking',
        image: theme.darkTheme
            ? 'assets/simulations/Backtracking_SudokuDark.png'
            : 'assets/simulations/Backtracking_SudokuLight.png',
        direct: BacktrackingHome(),
        infoLink: 'https://en.wikipedia.org/wiki/Backtracking',
        fav: _favorites[4],
      ),
      SimulationCard(
        id: 5,
        simulationName: "Freshers' App",
        image: theme.darkTheme
            ? 'assets/simulations/Freshers_iconLight.png'
            : 'assets/simulations/Freshers_iconLight.png',
        direct: FresherHome(),
        infoLink: 'https://github.com/dscnitp/freshers-portal-app#readme',
        fav: _favorites[4],
      ),
    ];
  }

  List<Widget> get all {
    getFavorites();
    return allSimulations();
  }

  List<Widget> get algorithms {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    _algorithm.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  List<Widget> get mathematics {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    _others.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  List<Widget> get favorites {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    for (int i = 0; i < _favorites.length; ++i) {
      if (_favorites[i] == 1) {
        widgets.add(allWidgets[i]);
      }
    }
    return widgets;
  }

  List<Widget> searchSims(String query) {
    query = query.toLowerCase();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allSimulations();
    final regex = RegExp('$query[a-z]* ');
    _searchTags.forEach((key, tags) {
      if (regex.hasMatch(tags)) {
        widgets.add(allWidgets[key]);
      }
    });
    return widgets;
  }

  void toggleFavorite(int index) async {
    _favorites[index] *= -1;
    List<String> favorites = _favorites.map((i) => i.toString()).toList();
    await prefs.setStringList('favorites', favorites);
    notifyListeners();
  }
}
