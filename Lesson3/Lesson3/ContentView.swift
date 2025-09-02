//
//  ContentView.swift
//  Lesson3
//
//  Created by Batuhan Gözegü on 2.09.2025.
//

import SwiftUI
import UIKit
struct ContentView: View {
    let ring = AngularGradient(
            gradient: Gradient(colors: [
                Color(red: 14/255, green: 165/255, blue: 233/255),
                Color(red: 99/255, green: 102/255, blue: 241/255),
                Color(red: 168/255, green: 85/255, blue: 247/255),
                Color(red: 14/255, green: 165/255, blue: 233/255)
            ]),
            center: .center
        )
    
    let bgGradient = LinearGradient(colors:[
        Color(red: 23/255, green: 23/255,blue: 36/255),
        .black
    ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    let plusGradient = RadialGradient(
        gradient: Gradient(colors: [
            Color(red: 34/255, green: 211/255, blue: 238/255),
            Color(red: 14/255, green: 165/255, blue: 233/255),
            Color(red: 16/255, green: 185/255, blue: 129/255),
        ]),
        center: .center,
        startRadius: 5,
        endRadius: 80
        )
    
    let minusGradient = RadialGradient(
        gradient: Gradient(colors: [
            Color(red: 168/255, green: 85/255, blue: 247/255),
            Color(red: 139/255, green: 92/255, blue: 246/255),
            Color(red: 99/255, green: 102/255, blue: 241/255),
        ]),
        center: .center,
        startRadius: 5,
        endRadius: 80
        )
    
    let undoGradient = RadialGradient(
        gradient: Gradient(colors: [
            Color(red: 14/255, green: 165/255, blue: 233/255),
            Color(red: 99/255, green: 102/255, blue: 241/255),
            Color(red: 168/255, green: 85/255, blue: 247/255),
        ]),
        center: .center,
        startRadius: 5,
        endRadius: 80
        )
    
    @State private var count : Int = 0
    
    var body: some View {
            
        
        ZStack{
            bgGradient.ignoresSafeArea()
            
            VStack{
                
                ZStack{
                    Circle()
                        .fill(.white.opacity(0.08))
                        .frame(width: 260,height: 260)
                        .overlay(
                            Circle()
                                .stroke(ring, lineWidth: 8)
                                .shadow(color:.white.opacity(0.4), radius: 4)
                        )
                        .overlay(
                            Text("\(count)")
                                .font(.system(size: 56,weight: .bold,design: .rounded))
                                .foregroundStyle(.white)
                        )
                }//zstack
                
                HStack(spacing:50){
                    
                    buttonView(gradient: minusGradient,
                               image: "minus",
                               action: {
                                    if count > 0 {
                                        count -= 1
                                    }
                               },
                               color: .purple)
                    
                    buttonView(gradient: undoGradient,
                               image: "arrow.clockwise",
                               action: {
                                    if count > 0 {
                                        count = 0
                                    }
                               },
                               color: .cyan)
    
                    buttonView(gradient: plusGradient,
                               image: "plus",
                               action: {
                                    count += 1
                               },
                               color: .cyan)
                }
                .padding(.top,12)
                
            }//vstack
            
        }//ztack
    }
}

struct buttonView:View {
    let gradient: RadialGradient
    let image: String
    let action: () -> Void
    let color: Color
    
    var body: some View {
        Button(action: action){
            Image(systemName: image)
                .font(.system(size: 30))
                .foregroundStyle(.white)
                .frame(width: 70,height: 70)
                .background(
                    Circle()
                        .fill(gradient)
                )
                .shadow(color:color.opacity(0.5),radius: 12)
        }
    }
}

#Preview {
    ContentView()
}
