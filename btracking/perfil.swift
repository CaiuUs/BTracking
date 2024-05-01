//
//  perfil.swift
//  btracking
//
//  Created by Turma01-20 on 03/02/24.
//

import SwiftUI

struct perfil: View {
    let alignments: [TextAlignment] = [.leading, .center, .trailing]
    @State private var alignment = TextAlignment.leading
    @FocusState private var nameIsFocused: Bool
    @State private var res: String = ""
    var body: some View {
        NavigationStack{
            ZStack{
                Color("color2")
                VStack{
                    Text("")
                        .frame(width: 470, height: 600)
                        .background(Color.blue)
                        .cornerRadius(380)
                        .ignoresSafeArea()
                    Spacer()
                        .frame(width: 400, height: 600)
                        .background(Color("color2"))
                        .ignoresSafeArea()
                }
                VStack{
                    Group {
                        Image("Image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                            .cornerRadius(12)
                        Text("Meus Dados")
                            .font(.largeTitle)
                        HStack{
                            Image(systemName: "person.fill")
                                .padding(.horizontal, 07)
                            Text("Nome Completo")
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Button("Editar") {
                                nameIsFocused = false
                            }
                        }
                        .frame(width: 260, height: 50)
                        .background(Color("color3"))
                        .cornerRadius(12)
                        .multilineTextAlignment(.center)
                        
                        HStack{
                            Image(systemName: "phone.connection.fill")
                                .padding(.horizontal, 07)
                            Text("Telefone")
                            Spacer()
                            Button("Editar") {
                                nameIsFocused = false
                            }
                        }
                        .frame(width: 260, height: 50)
                        .background(Color("color3"))
                        .cornerRadius(12)
                        .multilineTextAlignment(.center)
                        
                        HStack{
                            Image(systemName: "envelope.fill")
                                .padding(.horizontal, 07)
                            Text("Email")
                            Spacer()
                            Button("Editar") {
                                nameIsFocused = false
                            }
                        }
                        .frame(width: 260, height: 50)
                        .background(Color("color3"))
                        .cornerRadius(12)
                        .multilineTextAlignment(.center)
                        
                        HStack{
                            Image(systemName: "exclamationmark.lock.fill")
                                .padding(.horizontal, 07)
                            Text("Senha")
                            Spacer()
                            Button("Editar") {
                                nameIsFocused = false
                            }
                        }
                        .frame(width: 260, height: 50)
                        .background(Color("color3"))
                        .cornerRadius(12)
                        .multilineTextAlignment(.center)
                        Text("Pagamentos")
                        NavigationLink(destination: pagamento()){
                            Text("Acessar carteira").frame(width: 180, height: 50, alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                        }
                    }
                }
                .frame(width: 300, height: 570)
                .background(Color.white)
                .cornerRadius(25)
                .multilineTextAlignment(.center)
            }
        }.accentColor(Color.black)
    }
}

struct perfil_Previews: PreviewProvider {
    static var previews: some View {
        perfil()
    }
}
