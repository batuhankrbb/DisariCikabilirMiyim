//
//  CalisiyorMusunView.swift
//  DisariCikmaApp
//
//  Created by Batuhan Karababa on 19.11.2020.
//

import SwiftUI

struct CalisiyorMusunView:View{
   @Binding var calisiyorMusun:Bool
    var body: some View{
        HStack{
            VStack{
                Text("Çalışıyor musun?")
                    .font(.title)
                    .bold()
                Picker("", selection: $calisiyorMusun){
                    Text("Evet").tag(true)
                    Text("Hayır").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
                .frame(width: UIScreen.main.bounds.size.width / 2)
                
            }
            Spacer()
        }.padding()
    }
}
