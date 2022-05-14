//
//  AddNewFighter.swift
//  FinalProj
//
//  Created by Mitchell Melby on 5/9/22.
//

import SwiftUI
struct AddNewFood: View {
@StateObject var fighterList : FighterList

@State private var name: String = ""
@State private var description: String = ""
var body: some View {
    Form {
    Section(header: Text("Food Details")) {
    Image(systemName: "food.fill")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .padding()
    DataInput(title: "Name", userInput: $name)
    DataInput(title: "Description", userInput: $description)
    
    }
    Button(action: addNewFood) {
        Text("Add Food")
    }
    }
    }
    func addNewFood() {
    let newFood = Food(id: UUID().uuidString,
    name: name, description: description,imageName: "steak" )
    foodStore.foods.append(newFood)
    }

struct AddNewFood_Previews: PreviewProvider { static var previews: some View {
AddNewFood(foodStore: FoodStore(foods: foodData))
}
}
}


