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
                        .fill(self.board[row][col] == 0 ? Color.brown : getColor(name: color))
                        .onTapGesture {
                            self.board[row][col] = 1 - self.board[row][col]
                            let score = Int.random(in: 0...1)
                            self.board[row][col] = score
                            self.score += score
                            self.turns += 1
                            if score == 0 {
                                self.health -= 10
                                self.color = "red"
                            }else if score == 1 {
                                self.color = "yellow"
                            }
                        }
                }
                Text("Esplora una giungla piena di pericoli, raccogli monete e altri tesori nascosti per sopravvivere!")
                    .font(.subheadline)
                    .padding()
            }
        }
    }
}

func getColor(name: String) -> Color {
  switch name {
  case "red":
    return .red
  case "blue":
    return .blue
  case "green":
    return .green
  case "yellow":
    return .yellow
  case "orange":
    return .orange
  case "purple":
    return .purple
  case "gray":
    return .gray
  case "pink":
    return .pink
  default:
    return .black
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
