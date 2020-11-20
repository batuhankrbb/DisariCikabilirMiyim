//
//  KontrolButton.swift
//  DisariCikmaApp
//
//  Created by Batuhan Karababa on 19.11.2020.
//

import SwiftUI

struct KontrolButton:View{
    @Binding var uyariGoster:Bool
    var action: () -> ()
    var body: some View{
        Button(action: action, label: {
            Text("Kontrol Et!")
                .font(.title)
                .padding()
                .foregroundColor(.white)
                
                
        })
        .background(Capsule(style: .circular)
                        .foregroundColor(.blue))
        .alert(isPresented: $uyariGoster) {
            Alert(title: Text("Hey! Yoksa illegal bir şeyler mi yapıyorsun 🧐"), message: Text("16 Yaşının altındaki kişiler T.C kurallarına göre çalışamaz."), dismissButton: .default(Text("Tamamdır!")))
        }
    }
}
