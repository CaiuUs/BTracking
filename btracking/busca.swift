//
//  busca.swift
//  btracking
//
//  Created by Turma01-20 on 06/02/24.
//

import SwiftUI

struct busca: View {
    @StateObject var viewModel = ViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { i in
                    
                    let coord = viewModel.listaPonto.filter { $0.id == i.idPonto }
                    
                    
                    NavigationLink(destination: home(teste: coord[0].coordenadas), label: {
                        Text(i.nome)
                    })
         
                }
            }
            .navigationTitle("Buscar Pontos")
        }
        .searchable(text: $searchText, placement: .automatic)
        .onAppear(){
            viewModel.BaixarDados()
            
            
            
        }
    }
    var searchResults: [Ref] {
        if searchText.isEmpty {
            return viewModel.referencias
        } else {
            return viewModel.referencias.filter { $0.nome.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct busca_Previews: PreviewProvider {
    static var previews: some View {
        busca()
    }
}
