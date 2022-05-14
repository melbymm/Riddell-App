//
//  Fighter.swift
//  FinalProj
//
//  Created by Mitchell Melby on 5/5/22.
//

import Foundation
import SwiftUI

struct Fighter : Codable, Identifiable {
    var id: Int
    var ranking:  Int
    var name: String
    var age: Int
    var weight: Int
    var gender: String
    var height: Int
    var ufc_wins: Int
    var ufc_loses: Int
    var ufc_draws: Int
    var ufc_no_contests: Int
    var mma_wins: Int
    var mma_loses: Int
    var mma_draws: Int
    var mma_no_contests: Int
}
