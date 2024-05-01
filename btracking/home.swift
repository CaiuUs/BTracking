//
//  home.swift
//  btracking
//
//  Created by Turma01-20 on 03/02/24.
//

import SwiftUI
import MapKit


struct home: View {
    @StateObject var viewModel = ViewModel()
    @State private var searchText = ""
    @State var teste : CLLocationCoordinate2D?
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -5.359436, longitude: -49.1262396), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta:0.1))
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    @State private var sheet = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Map(coordinateRegion: $region, annotationItems: viewModel.listaPonto){
                        place in MapAnnotation(coordinate: place.coordenadas){
                            Button{
                                showingSheet2.toggle()
                            }label: {
                                Image(systemName: "bus")
                            }.sheet(isPresented: $showingSheet2){
                                onibus(onibus: place.Onibus)
                            }
                        }
                    }
                    .frame(width: 400, height: 580)
                    Spacer()
                    HStack{
                        Button("Buscar") {
                            showingSheet.toggle()
                        }
                        .padding(.horizontal, 25)
                        Spacer()
                    }
                    .frame(width: 350, height: 38)
                    .background(Color("color3"))
                    .cornerRadius(15)
                    .padding(.bottom, 55)
                    .sheet(isPresented: $showingSheet, content:{
                        NavigationStack {
                            List {
                                ForEach(searchResults, id: \.self) { i in
                                    
                                    let coord = viewModel.listaPonto.filter { $0.id == i.idPonto }
                                    
                                    Button(i.nome){
                                        region.center = coord[0].coordenadas
                                        region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta:0.01)
                                        showingSheet.toggle()
                                    }
                                }
                            }
                            .navigationTitle("Buscar Pontos")
                        }
                        .searchable(text: $searchText, placement: .automatic)
                    })
                    Spacer()
                }
                HStack{
                    Spacer()
                VStack {
                        Button("-") {
                            region.span.latitudeDelta /= 0.6
                            region.span.longitudeDelta /= 0.6
                        }
                        .padding(10)
                        .background(.gray)
                        .foregroundColor(.white)
                        Button("+") {
                            region.span.latitudeDelta *= 0.6
                            region.span.longitudeDelta *= 0.6
                        }
                        .padding(10)
                        .background(.gray)
                        .foregroundColor(.white)
                        Spacer()
                    }
                .padding()
                }
                .padding()
            }.onAppear(){
                viewModel.BaixarDados()
                
                if(teste != nil){
                    region.center = teste!
                    region.span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                }
            }
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

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
