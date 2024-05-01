//
//  pagamento.swift
//  btracking
//
//  Created by Turma01-20 on 08/02/24.
//

import SwiftUI

struct pagamento: View {
    @State private var showGreeting = true
    @State private var exampleState = false
    var historico = [
        hist(id: 1, nome: "Saída", msg: "Pagamento efetuado", foto: "https://cdn.icon-icons.com/icons2/3991/PNG/512/top_arrow_arrow_icon_253894.png", colorz: "color5"),
        hist(id: 2, nome: "Saída", msg: "Pagamento efetuado", foto: "https://cdn.icon-icons.com/icons2/3991/PNG/512/top_arrow_arrow_icon_253894.png", colorz: "color5"),
        hist(id: 3, nome: "Saída", msg: "Pagamento efetuado", foto: "https://cdn.icon-icons.com/icons2/3991/PNG/512/top_arrow_arrow_icon_253894.png", colorz: "color5"),
        hist(id: 4, nome: "Entrada", msg: "Depósito efetuado", foto: "https://cdn.icon-icons.com/icons2/3991/PNG/512/down_arrow_arrow_icon_253886.png", colorz: "color6"),
        hist(id: 5, nome: "Saída", msg: "Pagamento efetuado", foto: "https://cdn.icon-icons.com/icons2/3991/PNG/512/top_arrow_arrow_icon_253894.png", colorz: "color5"),
        hist(id: 6, nome: "Entrada", msg: "Depósito efetuado", foto: "https://cdn.icon-icons.com/icons2/3991/PNG/512/down_arrow_arrow_icon_253886.png", colorz: "color6"),
        hist(id: 7, nome: "Entrada", msg: "Depósito efetuado", foto: "https://cdn.icon-icons.com/icons2/3991/PNG/512/down_arrow_arrow_icon_253886.png", colorz: "color6"),
        hist(id: 8, nome: "Entrada", msg: "Depósito efetuado", foto: "https://cdn.icon-icons.com/icons2/3991/PNG/512/down_arrow_arrow_icon_253886.png", colorz: "color6")
    ]
    var body: some View {
        NavigationView {
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
                    .padding(140)
                    Group{
                        VStack{
                            
                            HStack{
                                Text("Saldo")
                                    .font(.system(size: 40))
                                    .padding(.horizontal, 10)
                                Spacer()
                                Text("")
                            }
                                .bold()
                                .font(Font.title)
                            
                            HStack{
                                Text("R$ 32,00")
                                    .padding(.horizontal, 10)
                                Spacer()

                                Text("")
                            }
                                .font(Font.largeTitle)
                                .bold()
                            HStack{
                                NavigationLink(destination: cartao()){
                                    HStack{
                                        Image(systemName: "creditcard.fill")
                                        Text("Cartões")
                                    }
                                    .frame(width: 130, height: 40)
                                    .background(Color("color3"))
                                    .foregroundColor(Color.black)
                                    .cornerRadius(25)
                                }
                                
                                HStack{
                                    Image(systemName: "wallet.pass.fill")
                                    Text("Depositar")
                                }
                                .frame(width: 130, height: 40)
                                .background(Color("color3"))
                                .cornerRadius(25)
                            }
                        }
                    }
                    .frame(width: 300, height: 190)
                    .background(Color.white)
                    .cornerRadius(25)
                    .multilineTextAlignment(.center)
                    .bold()
                    Group{
                        VStack{
                            HStack{
                                Toggle("Pagamento por", isOn: $showGreeting)
                                    .toggleStyle(SwitchToggleStyle(tint: .green))
                                    .padding(.horizontal, 25)
                                    .ignoresSafeArea()
                            }
                            HStack{
                                if showGreeting {
                                    Text("aproximação está ativado")
                                        .padding(.horizontal, 20)
                                }else{
                                    Text("aproximação está desativado")
                                        .padding(.horizontal, 20)
                                }
                                Spacer()
                            }
                        }
                    }
                    .frame(width: 300, height: 90)
                    .background(Color.white)
                    .cornerRadius(25)
                    .multilineTextAlignment(.center)
                    VStack{
                        Group{
                            HStack{
                                Text("Histórico")
                                    .bold()
                                    .font(Font.title)
                                    .padding(.horizontal, 100)
                                Spacer()
                                Text("")
                            }
                        }
                            ScrollView{
                                VStack{
                                    ForEach(historico) { i in
                                            HStack{
                                                (AsyncImage(url: URL(string: i.foto)){
                                                    image in image
                                                        .image?
                                                        .resizable()
                                                        .ignoresSafeArea()
                                                        .scaleEffect(0.8)
                                                        
                                                }
                                                    .frame(width: 90, height: 50))
                                                    .padding(.horizontal, 10)
                                                VStack {
                                                    HStack{
                                                        Text(i.nome)
                                                            .font(.subheadline)
                                                            .fontWeight(.semibold)
                                                            .foregroundColor(Color("\(i.colorz)"))
                                                        Spacer()
                                                            .padding(.horizontal, 100)
                                                    }
                                                    HStack{
                                                        Text(i.msg)
                                                            .font(.footnote)
                                                            .fontWeight(.light)
                                                        Spacer()
                                                    }
                                                }
                                            }
                                    }.padding(.horizontal)
                                }//vstack
                            }
                        }//zstack
                    }
                }
            }.accentColor(Color.black)
    }
}

struct pagamento_Previews: PreviewProvider {
    static var previews: some View {
        pagamento()
    }
}
