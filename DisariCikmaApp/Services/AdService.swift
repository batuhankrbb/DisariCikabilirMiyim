//
//  AdService.swift
//  DisariCikmaApp
//
//  Created by Batuhan Karababa on 20.11.2020.
//

import SwiftUI
import UIKit
import GoogleMobileAds

final class InterstitialService:NSObject, GADInterstitialDelegate{
    
    var interstitial:GADInterstitial = GADInterstitial(adUnitID: "")
    
    override init() {
        super.init()
        LoadInterstitial()
    }
    
    func LoadInterstitial(){
        let req = GADRequest()
        self.interstitial.load(req)
        self.interstitial.delegate = self
    }
    
    func showAd(){
        if self.interstitial.isReady{
           let root = UIApplication.shared.windows.first?.rootViewController
           self.interstitial.present(fromRootViewController: root!)
        }
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.interstitial = GADInterstitial(adUnitID: "")
        LoadInterstitial()
    }
}
