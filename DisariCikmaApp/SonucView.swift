//
//  SonucView.swift
//  DisariCikmaApp
//
//  Created by Batuhan Karababa on 19.11.2020.
//

import SwiftUI

struct SonucView: View {
    
    var gelenBilgiler: (anaMetin:String,bilgiMetin:String)
     
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            Spacer()
            Text(gelenBilgiler.anaMetin)
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding()

            Spacer()
            Spacer()
            
            Text(gelenBilgiler.bilgiMetin)
                .font(.title3)
                .padding()
                .padding(.bottom,20)
               
            
            BilgilendirmeView().padding(.bottom)
           
        }
      
    }
}

struct SonucView_Previews: PreviewProvider {
    static var previews: some View {
        SonucView(gelenBilgiler: (anaMetin: "String", bilgiMetin: "String"))
    }
}
