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
    
    var body: some View {
        VStack {
            VStack {
                Text("Monopoly Jungle Adventure")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
//                Text("Esplora una giungla piena di pericoli, raccogli monete e altri tesori nascosti per sopravvivere!")
//                    .font(.title)
//                    .padding()
                Text("Score: \(score) Turno: \(turns)")
                    .font(.title2)
            }
            ZStack {
//                Color.green
//                    .edgesIgnoringSafeArea(.all)
                
                GridStack(rows: board.count, columns: board[0].count){ row, col in
                                Rectangle()
                        .fill(self.board[row][col] == 0 ? Color.brown : Color.yellow)
                                    .onTapGesture {
                                        self.board[row][col] = 1 - self.board[row][col]
                                        let score = Int.random(in: 0...1)
                                        self.board[row][col] = score
                                        self.score += score
                                        self.turns += 1
                                    }
                            }
                
            }
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
