//
//  FighterDetail.swift
//  FinalProj
//
//  Created by Mitchell Melby on 5/9/22.
//

import SwiftUI

struct FighterDetail: View {
    let selectedFighter: Fighter
    var body: some View {
        Form {
            Section(header: Text("Fighter Details")) {
       VStack {
           Text("Name: ")
           Text(selectedFighter.name)
        .font(.headline)
           Text("MMA Wins-Losses-Draws-No Contest")
           HStack{
           Text(String(selectedFighter.mma_wins))
           Text(String(selectedFighter.mma_loses))
           Text(String(selectedFighter.mma_draws))
           Text(String(selectedFighter.mma_no_contests))
           }
           Text("UFC Wins-Losses-Draws-No Contest")
           HStack{
           Text(String(selectedFighter.ufc_wins))
           Text(String(selectedFighter.ufc_loses))
           Text(String(selectedFighter.ufc_draws))
           Text(String(selectedFighter.ufc_no_contests))
           }
        }

        
        }
        }
    }
}

struct FighterDetail_Previews: PreviewProvider {
    static var previews: some View {
        FighterDetail(selectedFighter: modelData[0])
    }
}
