//
//  conversas.swift
//  btracking
//
//  Created by Turma01-20 on 08/02/24.
//

import SwiftUI

struct conversas: View {
    var conversa: Grupos
    
    @State private var mensagem = ""
    
    var msgs = [
        "Onde ta o onibus?", "oi", "Cade o onibus"
    ]
    
    @State private var minhamsg: [String] = []
    
    func adicionarMensagem() {
            minhamsg.append(mensagem)
            mensagem = "" // Limpa o campo de texto após enviar a mensagem
        }

        func exibirMensagens(msgs: [String]) -> some View {
            ForEach(msgs, id: \.self) {
                Text($0)
                    .padding(.top, 50)
            }
        }
    var body: some View {
        ZStack{
            
            ScrollView{
//                HStack{
                VStack(){
                    ForEach(msgs, id: \.self){
                        i in
                        HStack{
                            Text("\(i)")
                                .foregroundColor(.white)
                                .frame(maxWidth: 200.0, minHeight: 30)
                                .background(Color.blue)
                                .cornerRadius(20)
                            Spacer()
                        }.padding(.horizontal)
                    }
                    ForEach(minhamsg, id: \.self){
                        i in
                        HStack{
                            Spacer()
                            Text("\(i)")
                                .foregroundColor(.white)
                                .frame(maxWidth: 200, minHeight: 30.0)
                                .background(Color(.gray))
                                .cornerRadius(20)
                                .position(x: 255, y: 50)
                            
                        }
                        
                    }
                }.padding(.top, 54)
                    
//                }

            }

            VStack(spacing: 10){
                AsyncImage(url: URL(string: conversa.foto)){
                    image in image
                        .image?
                        .resizable()
                }.frame(width: 50.0, height: 50.0)
                    .clipShape(Circle())
                Text(conversa.nome)
                    .font(.headline)
            }.position(x: 185, y: -20)
            
            
            HStack{
                Spacer()
                Button("Enviar"){
                    minhamsg.append(mensagem)
                    
                    mensagem = ""
                    
                }.position(x: 330, y: 520)
                    .buttonStyle(.borderedProminent)
            }
            
            TextField("Mensagem...", text: $mensagem)
                    .padding(12)
                    .padding(.trailing, 48)
                    .frame(width: 290.0)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                    .position(x: 155, y: 520)
            
        }
    }
}

struct conversas_Previews: PreviewProvider {
    static var previews: some View {
        conversas()
    }
}
