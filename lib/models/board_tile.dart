import 'package:flutter/material.dart ';

class BoardTiles {
  final int id;
  String symbol;
  Color color;
  bool enable;

  BoardTiles(
    this.id,{
      this.symbol='',
      this.color= Colors.black26,
      this.enable= true,
    });
}
/*Painel de ClasseTile
Crie uma classe BoardTile (lib → models → board_tile.dart), que irá persistir nas informações das células do tabuleiro. Esta classe representará uma célula do tabuleiro, para isso, vamos criar um identificador para ela, guardar uma cor (vermelho e azul) e símbolo (X e O). Quando uma célula está vazia, significa que esta esta habilitada para o jogador adicionar uma peça nela (enable = true).*/

