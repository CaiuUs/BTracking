//
//  comunidade.swift
//  btracking
//
//  Created by Turma01-20 on 03/02/24.
//

import SwiftUI

struct comunidade: View {
    @State private var pesquisar = ""
    
    var comunidade = [
        Grupos(id: 1, nome: "Geral", msg: "Semaforo esta quebrado", foto: "https://blog.tuaterra.com.br/wp-content/uploads/2019/06/1446934722.jpg"),
        Grupos(id: 2, nome: "Nova Maraba", msg: "Transito esta enorme", foto: "https://correiodecarajas.com.br/wp-content/uploads/2022/12/PARTAGE-MARABA-1024x768.jpeg"),
        Grupos(id: 3, nome: "Velha Maraba", msg: "Alguem sabe onde esta o onibus", foto: "https://camaradecultura.org/wp-content/uploads/2023/02/Maraba-PA.jpg"),
        Grupos(id: 4, nome: "Cidade Nova", msg: "Onibus quebrou na frente da praca", foto: "https://live.staticflickr.com/232/448839691_27c4de55b1_b.jpg"),
        Grupos(id: 5, nome: "Cidade Jardim", msg: "Onibus saindo daqui no C3", foto: "https://www.unifesspa.edu.br/images/Destaque_Fachada-Unifesspa.gif"),
        Grupos(id: 6, nome: "Novo Horizonte", msg: "acidente na Av. Tocantins", foto: "https://maraba.pa.gov.br/wp-content/uploads/2018/05/MG_4439-1.jpg")
    ]
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView{
                    VStack{
                        ForEach(comunidade) { grupos in
                            NavigationLink(destination: conversas(conversa: Grupos(id: grupos.id, nome: grupos.nome, msg: grupos.msg, foto: grupos.foto))){
                                HStack{
                                    (AsyncImage(url: URL(string: grupos.foto)){
                                        image in image
                                            .image?
                                            .resizable()
                                    }
                                        .frame(width: 50, height: 50))
                                    .clipShape(Circle())
                                    VStack {
                                        HStack{
                                            Text(grupos.nome)
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                            Spacer()
                                        }
                                        HStack{
                                            Text(grupos.msg)
                                                .font(.footnote)
                                                .fontWeight(.light)
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                }
                                Image(systemName: "arrow.right")
                            }
                            .foregroundColor(.black)
                        }.padding(.horizontal)
                    }//vstack
                }
                .navigationTitle("Comunidades")
            }//zstack
        }//naviagtionstack
        .searchable(text: $pesquisar)
    }
}

struct comunidade_Previews: PreviewProvider {
    static var previews: some View {
        comunidade()
    }
}
