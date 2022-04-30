//
//  ContentView.swift
//  BoilingWaterPart2
//
//  Created by gabi brown on 2022-04-29.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State var temperatureEntry = 0.0
    
    @State var kpa = 0.0
    
    // MARK: Computed properties
    var seaLevel: Double {
        return 5 * temperatureEntry - 400
    }
    
    var feedback: String {
        switch temperatureEntry {
        case ...(0 + seaLevel):
            return "Sea level"
        case 1...99 + seaLevel:
            return "Above sea level"
        case 100..<101 + seaLevel:
            return "At sea level"
        case 101...200 + seaLevel:
            return "below sea level"
        default:
            return "Sea level"
        }
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Boiling water")
                    .bold()
                Text("Temperature")
                
                
                Spacer()
                
            }
            
            Group {
                Slider(value: $temperatureEntry,
                       in: -100...200,
                       step: 1,
                       label: {
                    Text("Temperature")
                },
                       minimumValueLabel: {
                    Text("-100")
                },
                       maximumValueLabel: {
                    Text("200")
                })
                
                Text("temperature is \(temperatureEntry)")
                
                Text("kpa is \(seaLevel)")
                
                Text("\(feedback)")
            }
            
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
