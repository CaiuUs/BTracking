//
//  ContentView.swift
//  btracking
//
//  Created by Turma01-20 on 03/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            comunidade()
                .tabItem {
                    Label("Comunidade", systemImage: "message")
                }
            perfil()
                .tabItem {
                    Label("Perfil", systemImage: "person.crop.circle.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
