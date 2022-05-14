//
//  FighterList.swift
//  FinalProj
//
//  Created by Mitchell Melby on 5/9/22.
//

import Foundation
import SwiftUI
import Combine

class FighterList : ObservableObject {
    
    @Published var fighters: [Fighter]
    
    init (fighters: [Fighter] = []){
    self.fighters =  fighters
    
}
    
    func randomChoice   ()  ->  Fighter {
        return fighters.randomElement()!
    }

}
