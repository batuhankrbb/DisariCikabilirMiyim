//
//  YasPicker.swift
//  DisariCikmaApp
//
//  Created by Batuhan Karababa on 19.11.2020.
//

import SwiftUI

struct YasPicker:View{
    @Binding var yas:Int
    var body: some View{
        HStack{
            Spacer()
            VStack(spacing: 0){
                Text("Yaşınız:")
                    .font(.title)
                    .padding(.leading)
                Text(yas > 45 ? "👴" : "👦")
                    .font(.largeTitle)
            }
                
            Picker("",selection: $yas){
                ForEach((1...120), id: \.self){ num in
                    Text("\(num)")
                }
            }
            
            .labelsHidden()
        }.padding()
        .background(Color.init(white: 0.95))
        .cornerRadius(20)
        
    }
}
