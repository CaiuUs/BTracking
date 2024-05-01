//
//  cartao.swift
//  btracking
//
//  Created by Turma01-20 on 08/02/24.
//

import SwiftUI

struct cartao: View {
    var body: some View {
        ZStack{
            Color("color2")
            VStack {
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
                Text("")
                    .padding(10)
                Group{
                    VStack{
                        Text("Adicionar Cartão")
                            .bold()
                            .font(Font.title)
                        VStack{
                            HStack{
                                Text("Número do Cartão")
                                    .padding(.horizontal, 40)
                                Spacer()
                                Text("")
                            }
                            .frame(width: 270, height: 55)
                            .background(Color("color3"))
                            .cornerRadius(25)
                            HStack{
                                HStack{
                                    Text("Mês / Ano ")
                                        .padding(.horizontal, 30)
                                    Spacer()
                                    Text("")
                                }
                                .frame(width: 150, height: 55)
                                .background(Color("color3"))
                                .cornerRadius(25)
                                HStack{
                                    Text("CVV ")
                                        .padding(.horizontal, 30)
                                    Spacer()
                                    Text("")
                                }
                                .frame(width: 110, height: 55)
                                .background(Color("color3"))
                                .cornerRadius(25)
                            }
                            HStack{
                                Text("CPF")
                                    .padding(.horizontal, 40)
                                Spacer()
                                Text("")
                            }
                            .frame(width: 270, height: 55)
                            .background(Color("color3"))
                            .cornerRadius(25)
                            
                            Text("Salvar cartão").frame(width: 180, height: 50, alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                        }
                    }
                    .frame(width: 300, height: 500)
                    .background(Color.white)
                    .cornerRadius(25)
                    .multilineTextAlignment(.center)
                    .bold()
                }
            }.accentColor(Color.black)
        }
    }
}

struct cartao_Previews: PreviewProvider {
    static var previews: some View {
        cartao()
    }
}
