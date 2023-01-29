//
//  ContentView.swift
//  JumanjiGame
//
//  Created by Giorgio Giannotta on 28/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var board = [
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
    ]
    @State private var score = 0
    @State private var turns = 0
    @State private var health = 100
    @State private var color = ""
    @State private var gameOver = false

    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("Monopoly Jungle Adventure")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    Text("Score: \(score) Turns: \(turns) Health: \(health)")
                        .font(.title2)
                }
                GridStack(rows: board.count, columns: board[0].count){ row, col in
                    Rectangle()
                        .fill(self.board[row][col] == 0 ? Color.brown : (self.board[row][col] == -1 ? Color.red : Color.yellow))
                        .onTapGesture {
                            self.board[row][col] = 1 - self.board[row][col]
                            let score = Int.random(in: -1...1)
                            self.board[row][col] = score
                            if score == 1 {
                                self.score += score
                            }
                            self.turns += 1
                            if score == -1 {
                                self.health -= 10
//                                self.color = "red"
                            }else if score == 1 {
                                self.color = "yellow"
                            }
                            gameOverd()
                        }
                }
                Text("Esplora una giungla piena di pericoli, raccogli monete e altri tesori nascosti per sopravvivere!")
                    .font(.subheadline)
                    .padding()
            }
        }.alert(isPresented: $gameOver) {
            Alert(title: Text("Game Over"), message: Text("Il tuo punteggio è \(score) e hai completato \(turns) turni"), dismissButton: .default(Text("Ok")) {
                self.score = 0
                self.turns = 0
                self.health = 100
                self.color = ""
                self.board = [
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0],
                ]
            })
        }
    }
    func gameOverd() -> Bool {
        if health <= 0 {
            gameOver = true
            return true
        } else {
            return false
        }
    }
}



func getColor(name: String) -> Color {
  switch name {
  case "red":
    return .red
  case "green":
    return .green
  case "yellow":
    return .yellow
  default:
    return .black
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
