//
//  ContentView.swift
//  firstApp
//
//  Created by Mustafa Tümsek on 20.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State var total = ""
    @State var tipPercent = 15.0
    @State var isaret: String = "$"
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.colorScheme) var systemColorScheme
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "dollarsign.circle.fill")
                    .imageScale(.large)
                    .foregroundStyle(.green)
                    .font(.title)
                Text("Tip Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.top, 0.0)
            
            HStack {
                Text(isaret)
                    .padding(.leading, 140.0)
                TextField("Amount", text: $total)
            }
            .padding(.top, 200.0)
            
            HStack {
                Slider(value: $tipPercent, in: 1...30, step: 1.0)
                Text("\(Int(tipPercent))")
                Text("%")
            }
            
            if let totalNum = Double(total) {
                Text("Tip Amount: \(isaret)\(totalNum * tipPercent / 100, specifier: "%0.2f")")
            } else {
                Text("Please add a numeric value.")
                    .font(.callout)
            }
            
            Menu {
                Button(action: { isaret = "€" }) {
                    Label("Euro", systemImage: "eurosign")
                }
                Button(action: { isaret = "$" }) {
                    Label("American dollar", systemImage: "dollarsign")
                }
                Button(action: { isaret = "₺" }) {
                    Label("Turkish lira", systemImage: "turkishlirasign")
                }
            } label: {
                Label("Currency", systemImage: "slider.horizontal.3")
            }
            .padding(.top, 300.0)
            .font(.title3)
            
            Spacer()
            
            Button(action: {
                isDarkMode.toggle()
            }) {
                HStack {
                    Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    Text(isDarkMode ? "Switch to Light Mode" : "Switch to Dark Mode")
                }
            }
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .padding()
    }
}

#Preview {
    ContentView()
}
