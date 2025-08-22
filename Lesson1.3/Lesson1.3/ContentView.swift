//
//  ContentView.swift
//  Lesson1.3
//
//  Created by Batuhan Gözegü on 21.08.2025.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    let gradient = LinearGradient(colors: [
        Color(red: 2/255, green: 0/255, blue: 36/255),
        Color(red: 0/255, green: 0/255, blue: 130/255),
        Color(red: 17/255, green: 75/255, blue: 145/255),
        Color(red: 26/255, green: 106/255, blue: 153/255),
        Color(red: 50/255, green: 157/255, blue: 179/255),
        Color(red: 107/255, green: 211/255, blue: 232/255)
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing)
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                VStack(spacing: 16){
                    
                    VStack(spacing: 18){
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(gradient,lineWidth: 3))
                            .shadow(color: .white.opacity(0.4), radius: 6)
                        Text("Batuhan Gözegü")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        Text("Erkek, 23 Yaşında")
                            .modifier(SubTitleStyle())
                        Text("Boy: 1.75m - Öğrenci")
                            .modifier(SubTitleStyle())
                        
                        HStack(spacing: 16){
                            CardView(text1: "200", text2: "Takipçi")
                            
                            CardView(text1: "190", text2: "Takip Edilen")
                            
                            CardView(text1: "1.2K", text2: "Beğeni")
                        }
                        .padding(.horizontal,16)
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        VStack(spacing: 0) {
                            gradient
                                .frame(height: 291 + geo.safeAreaInsets.top)
                            Color.white
                        }
                        .ignoresSafeArea(edges: .top)
                    )
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            
                            Text("Hakkımda")
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("""
                    Ben Batuhan Gözegü, 22 yaşındayım ve Tekirdağ Namık Kemal Üniversitesi’nde bilgisayar mühendisliği 4. sınıf öğrencisiyim. Kod yazmak, yeni teknolojileri keşfetmek ve kendi projelerimi geliştirmek benim için hem hobi hem de meslek hedefim. Özellikle iOS geliştirme ve kullanıcı deneyimi konularında meraklıyım.
                    """)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black.opacity(0.2), lineWidth: 0.1)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .shadow(color: .black.opacity(0.1), radius: 2, y: 2)
                            )
                        }
                        .padding(16)
                        HStack{
                            HStack{
                                Image("instagram")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("@batuhangozegu")
                            }.frame(maxWidth: .infinity,alignment: .leading)
                            HStack{
                                Image("linkedin")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text("batuhangozegu")
                            }.frame(maxWidth: .infinity,alignment: .trailing)
                                
                        }
                        .padding()
                        
                        
                    }
                    
                    
                    HStack{
                        Button("Takip Et"){
                            print("takip et")
                        }
                        .foregroundStyle(.white)
                        .frame(height: 40)
                        .frame(maxWidth:.infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.3), lineWidth: 1)
                                .background(
                                    LinearGradient(colors: [
                                        Color(red: 0/255, green: 0/255, blue: 130/255),
                                        Color(red: 17/255, green: 75/255, blue: 145/255),
                                        Color(red: 26/255, green: 106/255, blue: 153/255),
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(radius: 2)
                        )
                        
                        Button("Mesaj Gönder"){
                            print("mesaj gönder")
                        }
                        .foregroundStyle(.black)
                        .frame(height: 40)
                        .frame(maxWidth:.infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(gradient, lineWidth: 1)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(radius: 2)
                        )
                        
                    }.padding(.horizontal)
                    
                    
                    
                    Spacer()
                }//vstack
                Spacer()
            }//zstack
        }//geostack
    }
}

struct CardView: View {
    
        let text1 : String
        let text2 : String
    
    var body: some View {
         
        VStack{
            Text(text1)
            Text(text2)
                .foregroundStyle(.gray)
        }
        .padding()
        .font(.system(size: 13, weight: .bold))
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .gray.opacity(0.8), radius: 1)
    }
}


struct SubTitleStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .medium))
            .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
