//
//  viewModel.swift
//  btracking
//
//  Created by Turma01-20 on 03/02/24.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var listaPonto : [ponto] = []
    @Published var referencias : [Ref] = []
    
    func BaixarDados(){
        guard let url = URL(string: "http://192.168.128.59:1880/lerponto") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let jsonDecodificado = try JSONDecoder().decode([ponto].self, from: data)
                DispatchQueue.main.async{
                    self?.listaPonto = jsonDecodificado
                    
                    for ponto in self!.listaPonto{
                        for ref in ponto.referencia{
                            self?.referencias.append(ref)
                        }
                    }
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
