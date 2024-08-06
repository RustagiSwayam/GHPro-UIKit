//
//  NetworkManager.swift
//  GHPro
//
//  Created by Swayam Rustagi on 18/07/24.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    let baseUrl: String = "https://api.github.com/users/"
    
    private init(){ }
    
    func getFollowers(for username: String, page: Int, completed: @escaping([Follower]?, String?)-> Void){
        
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){data, response, error in
            
            //error handling
            if let _ =  error{
                completed(nil, "Unable to process request, Please check your internet connection.")
                return
            }
            
            //response handling
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(nil, "Invalid response from the server or Invalid username. Please try again.")
                return
            }
            
            //data handling
            guard let data = data else{
                completed(nil, "Unable to fetch data from the server, Please try again.")
                return
            }
            
            do{
               let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            }catch{
                completed(nil, "Unable to fetch data from the server, Please try again.")
            }
        }
        
        task.resume() //actually starts the network call
    }
}
