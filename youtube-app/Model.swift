//
//  Model.swift
//  youtube-app
//
//  Created by Uwais Alqadri on 26/07/20.
//  Copyright © 2020 Uwais Alqadri. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        // create a url project
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // get URLSession object
        let session = URLSession.shared
        
        // get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            do {
                // parsing data into a video object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            } catch {
                
            }
        
            
        }
        
        // kick off the task
        dataTask.resume()
    }
    
}
