//
//  ContentView.swift
//  Party calculator
//
//  Created by Sergey obrien on 06.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Сумма чека", text: $checkAmount)
                    Picker("Компания из:", selection:
                            $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) человек(а)")
                        }
                    }
                }
                Section(header: Text("Сколько чаевых вы хотите оставить?")) {
                    Picker("Tip percentages", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                if totalPerPerson > 0.001 {
                    Section(header: Text("Сумма на одного человека:")) {
                        Text("\(totalPerPerson, specifier: "%.2f")")
                    }
                }
    
            }
            .navigationBarTitle("Party calculator", displayMode: .inline)
        }
    }
}





































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


