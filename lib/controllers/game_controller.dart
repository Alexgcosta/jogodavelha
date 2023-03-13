import 'dart:math';

import 'package:jogodavelha/core/constants.dart';
import 'package:jogodavelha/core/winner_rules.dart';
import 'package:jogodavelha/models/board_tile.dart';
import '../enums/player_type.dart';
import 'package:jogodavelha/enums/winner_type.dart';

class GameController {
  List<BoardTiles> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  late PlayerType currentPlayer;
  late bool isSinglePlayer;

  bool get hasMoves =>
      (movesPlayer1.length + movesPlayer2.length) != BOARD_SIZE;

  GameController() {
    _initialize();
  }

  void _initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = PlayerType.player1;
    isSinglePlayer = false;
    tiles =
        List<BoardTiles>.generate(BOARD_SIZE, (index) => BoardTiles(index + 1));
  }

  void reset() {
    _initialize();
  }

  void markBoardTileByIndex(index) {
    final tile = tiles[index];
    if (currentPlayer == PlayerType.player1) {
      _markBoardTileWithPlayer1(tile);
    } else {
      _markBoardTileWithPlayer2(tile);
    }

    tile.enable = false;
  }

  void _markBoardTileWithPlayer1(BoardTiles tile) {
    tile.symbol = PLAYER1_SYMBOL;
    tile.color = PLAYER1_COLOR;
    movesPlayer1.add(tile.id);
    currentPlayer = PlayerType.player2;
  }

  void _markBoardTileWithPlayer2(BoardTiles tile) {
    tile.symbol = PLAYER2_SYMBOL;
    tile.color = PLAYER2_COLOR;
    movesPlayer2.add(tile.id);
    currentPlayer = PlayerType.player1;
  }

  bool _checkPlayerWinner(List<int> moves) {
    return winnerRules.any((rule) =>
        moves.contains(rule[0]) &&
        moves.contains(rule[1]) &&
        moves.contains(rule[2]));
  }

  WinnerType checkWinner() {
    if (_checkPlayerWinner(movesPlayer1)) return WinnerType.player1;
    if (_checkPlayerWinner(movesPlayer2)) return WinnerType.player2;
    return WinnerType.none;
  }

  int automaticMove() {
    var list = new List.generate(9, (i) => i + 1);
    list.removeWhere((element) => movesPlayer1.contains(element));
    list.removeWhere((element) => movesPlayer2.contains(element));

    var random = new Random();
    var index = random.nextInt(list.length - 1);
    return tiles.indexWhere((tile) => tile.id == list[index]);
  }
}