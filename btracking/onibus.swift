//
//  onibus.swift
//  btracking
//
//  Created by Turma01-20 on 08/02/24.
//

import SwiftUI

struct onibus: View {
    @State var onibus: [Onibus] = []
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Escalas")
                        .font(.system(size: 35))
                        .bold()
                    Spacer()
                }.padding()
                ForEach(onibus, id: \.self) { i in
                    VStack{
                        HStack{
                            VStack {
                                HStack{
                                    Text(i.onibus!)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                HStack{
                                    Text(i.rota!)
                                        .font(.footnote)
                                        .fontWeight(.light)
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                }
                                HStack{
                                    Text(i.hora!)
                                        .font(.footnote)
                                        .fontWeight(.light)
                                    Spacer()
                                }
                            }
                        }
                    }
                }.padding(.horizontal)
            }
        }
        }
    }

struct onibus_Previews: PreviewProvider {
    static var previews: some View {
        onibus()
    }
}
