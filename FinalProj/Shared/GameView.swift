//
//  SwiftUIView.swift
//  FinalProj
//
//  Created by Mitchell Melby on 5/4/22.
//

import SwiftUI

struct GameView: View {
    @State private var name: String = ""
    @StateObject var fighterList: FighterList = FighterList(fighters: modelData)
    @StateObject var emptyList: FighterList = FighterList(fighters: emptyModelData)
    var choice: Fighter  =  FighterList(fighters: modelData).randomChoice()
    var guessCount: Int = 0
    @State var wonGame: Bool = false
    @State var lostGame: Bool = false

    var body: some View {
        
        
       VStack {
           //Text(choice.name)
           Text("Guess \(emptyList.fighters.count)/8")
           Form {
            DataInput(title: "Enter Name", userInput: $name)
               Button(action: addNewFighter) {
                   Text("Add Fighter")
               }
           }
           if wonGame{
               NavigationLink (destination: GameView()){
               Text("Congrats, you win! It is  \(choice.name) Click to play again")
                   
               }
           }
           else if lostGame{
               NavigationLink (destination: GameView()){
               Text("The answer is \(choice.name), Click to play again")
                   
               }
           }
           else{
               
               HStack{
                   Text("").font(.system(size: 15)).frame(width: 12, height: 50)

               Text("Name").font(.system(size: 12)).frame(width: 75, height: 50)
           Text("Age").font(.system(size: 12)).frame(width: 28, height: 50)
           Text("Rank").font(.system(size: 12)).frame(width: 30, height: 50)
           Text("Weight").font(.system(size: 11)).frame(width: 39, height: 50)
           Text("Height").font(.system(size: 12)).frame(width: 38, height: 50)
           Text("MMA Wins").font(.system(size: 12)).frame(width: 32, height: 50)
           Text("MMA Losses").font(.system(size: 12)).frame(width: 50, height: 50)
                   Text("").font(.system(size: 15)).frame(width: 15, height: 50)
                   Spacer()
           }.frame(
            minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .topLeading ) }
           
           /* https://stackoverflow.com/questions/56487323/make-a-vstack-fill-the-width-of-the-screen-in-swiftui
              */
           NavigationView {
               List {
                   ForEach (emptyList.fighters)
                   {  fighter
                       in
                       ListCell(fighter:fighter, choice:choice)
                   }
                }}
           Spacer()
           NavigationLink(destination: HelpScreen()) {
               Text("Help")
           }
       }
            
    }
    /* https://serveanswer.com/questions/type-cannot-conform-to-accessibilityrotorcontent */
    func addNewFighter(){
        
        for fighter in fighterList.fighters {
            if fighter.name.capitalized==name.capitalized {
                emptyList.fighters.append(fighter)
            }
        }
        if choice.name.capitalized == name.capitalized {
            wonGame = true
        }
        else if emptyList.fighters.count >= 9 {
            lostGame = true
        }
        
    }
    /*func wonGame(){
        // enable pop up for if game ends
            Text("Congrats, it is ")
            Text(choice.name)
            NavigationView {
                Text("New Game")
            }
            NavigationLink (destination: GameView()){
                Text("New Game")

            }
        
    }
     */
    }



struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .padding()
    }
}

struct ListCell: View {
    var fighter: Fighter
    var choice: Fighter
    var body: some View {
        ScrollView {
            if fighter.name == choice.name  {
                
                //wonGame = true
            }
            else {
            
        NavigationLink(destination: FighterDetail(selectedFighter: fighter)) {
                VStack {
            HStack {
                if choice.name.capitalized != fighter.name.capitalized {
                    Text(fighter.name).frame(width: 80, height: 50)
                }
                else {
                    Text(fighter.name).background(Color .green).frame(width: 80, height: 50)
                }
                
                if choice.age == fighter.age {
                Text(String(fighter.age)).background(Color .green).frame(width: 28, height: 50)
                }
                else if choice.age == fighter.age - 1 || fighter.age == choice.age - 1 || choice.age == fighter.age - 2 || fighter.age == choice.age - 2 {
                    Text(String(fighter.age)).background(Color .yellow).frame(width: 28, height: 50)
                }
                else {
                    Text(String(fighter.age)).frame(width: 28, height: 50)
                }
                if choice.ranking == fighter.ranking {
                Text(String(fighter.ranking)).background(Color .green).frame(width: 28, height: 50)
                }
                else if choice.ranking - fighter.ranking  == 1 || choice.ranking - fighter.ranking  == 2 || fighter.ranking - choice.ranking  == 1 || fighter.ranking - choice.ranking  == 2 {
                    Text(String(fighter.ranking)).background(Color .yellow).frame(width: 28, height: 50)
                    }
                else {
                    Text(String(fighter.ranking)).frame(width: 28, height: 50)
                }
                
                if fighter.weight == choice.weight {
                    Text(String(fighter.weight)).font(.system (size: 15)).background(Color .green).frame(width: 28, height: 50)
                }
                else if fighter.weight == choice.weight + 10 || fighter.weight == choice.weight + 15 || fighter.weight == choice.weight - 10 || fighter.weight == choice.weight - 15 {
                    Text(String(fighter.weight)).font(.system (size: 15)).background(Color .yellow).frame(width: 28, height: 50)
                    }
                else if (fighter.weight == 265 && choice.weight == 205) || (fighter.weight == 205 && choice.weight == 265) {
                    Text(String(fighter.weight)).font(.system (size: 15)).background(Color .yellow).frame(width: 28, height: 50)
                }
                else {
                    Text(String(fighter.weight)).font(.system (size: 15)).frame(width: 28, height: 50)
                }

                if fighter.height == choice.height {
                    Text(String(fighter.height)).background(Color .green).frame(width: 28, height: 50)
                }
                else if fighter.height == choice.height + 1 || fighter.height == choice.height + 2 || fighter.height == choice.height - 1 || fighter.height == choice.height - 2 {
                    Text(String(fighter.height)).background(Color .yellow).frame(width: 28, height: 50)
                    }
                else {
                    Text(String(fighter.height)).frame(width: 28, height: 50)
                }
                
                if fighter.mma_wins == choice.mma_wins {
                    Text(String(fighter.mma_wins)).background(Color .green).frame(width: 28, height: 50)
                }
                else if fighter.mma_wins == choice.mma_wins + 1 || fighter.mma_wins == choice.mma_wins + 2 || fighter.mma_wins == choice.mma_wins - 1 || fighter.mma_wins == choice.mma_wins - 2 {
                    Text(String(fighter.mma_wins)).background(Color .yellow).frame(width: 28, height: 50)
                    }
                else {
                    Text(String(fighter.mma_wins)).frame(width: 28, height: 50)
                }
                if fighter.mma_loses == choice.mma_loses {
                    Text(String(fighter.mma_loses)).background(Color .green).frame(width: 28, height: 50)
                }
                else if fighter.mma_loses == choice.mma_loses + 1 || fighter.mma_loses == choice.mma_loses + 2 || fighter.mma_loses == choice.mma_loses - 1 || fighter.mma_loses == choice.mma_loses - 2 {
                    Text(String(fighter.mma_loses)).background(Color .yellow).frame(width: 28, height: 50)
                    }
                else {
                    Text(String(fighter.mma_loses)).frame(width: 28, height: 50)
                }
                     
            }
                }.frame(width:300)
            }
        }
        }
    }
}
