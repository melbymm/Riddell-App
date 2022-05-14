//
//  ContentView.swift
//  Shared
//
//  Created by Mitchell Melby on 5/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
   NavigationView{
       VStack {
           Text("Welcome to Riddell")
               .font(.largeTitle)
               .fontWeight(.heavy)
               .foregroundColor(Color.red)
           Spacer()
           Text("The UFC version of Wordle").font(.title2)
               .foregroundColor(Color .gray)
        
        Spacer()
           Spacer()
           
           Spacer()


        NavigationLink(destination: GameView()){
            
            Text("Start Game").font(.title2).frame(width: 300, height: 100).background(Color .red)
                .foregroundColor(Color.white)
                
            
        }
           Spacer()
           Spacer()
           

        }
           
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
