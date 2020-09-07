//
//  ViewController.swift
//  Movies Searcher
//
//  Created by Adwait Barkale on 07/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var txtFieldSearchMovie: UITextField!
    @IBOutlet weak var tableListMovies: UITableView!
    
    var arrMovie:[Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtFieldSearchMovie.delegate = self
        tableListMovies.delegate = self
        tableListMovies.dataSource = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies()
    {
        txtFieldSearchMovie.resignFirstResponder()
        guard let text = txtFieldSearchMovie.text,txtFieldSearchMovie.text != "" else {
            return
        }
        let strURL = "https://www.omdbapi.com/?apikey=4acadd1&s=fast%20and&type=movie"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: URL(string: strURL)!) { (data, response, err) in
            guard let data = data,err == nil else { return }
            var objResult: MovieResult?
            do{
                objResult = try JSONDecoder().decode(MovieResult.self, from: data)
            }catch{
                print("Error While Decoding !!")
            }
            
            guard let finalResult = objResult else { return }
            print(finalResult.Search[0].Title)
            
            //Update Array
            self.arrMovie.removeAll()
            let newData = finalResult.Search
            self.arrMovie.append(contentsOf: newData)
            
            //Update TableView
            DispatchQueue.main.async {
                self.tableListMovies.reloadData()
            }
            
            
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

