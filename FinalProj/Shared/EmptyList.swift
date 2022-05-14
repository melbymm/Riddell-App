//
//  EmptyList.swift
//  FinalProj
//
//  Created by Mitchell Melby on 5/9/22.
//


import Foundation
import SwiftUI
import Combine

class EmptyList : ObservableObject {
    @Published var fighters: [Fighter]
    init (fighters: [Fighter] = []){
    self.fighters =  []
}
    
}
