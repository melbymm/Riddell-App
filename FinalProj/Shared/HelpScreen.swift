//
//  HelpScreen.swift
//  FinalProj
//
//  Created by Mitchell Melby on 5/12/22.
//

import SwiftUI

struct HelpScreen: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                Text("How to Play: ").foregroundColor(.red).frame(width: 300)
            Text("Enter a correctly spelled UFC fighter's name, and click the add fighter button to make a guess").foregroundColor(.red).frame(width: 300)
            Text("There are 7 attributes for each fighter").foregroundColor(.red).frame(width: 300)
            Text("If your guess shares an attribute value with the answer, the attribute will be listed in the color green").foregroundColor(.green).frame(width: 300)
            Text("For the Age, rank, height, mma wins, and mma losses values, if the attribute value of your guess is within 2, the value will be listed in the color yellow.").foregroundColor(.yellow).frame(width: 300)
            Text("For weight, the value will be in the color yellow if your guess and the answer are 1 weight class apart. ").foregroundColor(.yellow).frame(width: 300)
            Text("Champions are listed as rank 0, unranked fighters are listed as rank 16 ").foregroundColor(.red)
            Text("Data is not up to date, data  is as of 12/4/2021. Dataset avaliable at https://www.kaggle.com/datasets/axeltorbenson/ufc-roster-datastatistics ").foregroundColor(.red).frame(width: 300)

            
        }
            
        }
    }
}

struct HelpScreen_Previews: PreviewProvider {
    static var previews: some View {
        HelpScreen()
    }
}
