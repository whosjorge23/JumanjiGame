//
//  Utils.swift
//  JumanjiGame
//
//  Created by Giorgio Giannotta on 29/01/23.
//

import SwiftUI

class Utils {
    
    func getColor(name: String) -> Color {
      switch name {
      case "red":
        return .red
      case "brown":
        return .brown
      case "yellow":
        return .yellow
      default:
        return .black
      }
    }
    
}
