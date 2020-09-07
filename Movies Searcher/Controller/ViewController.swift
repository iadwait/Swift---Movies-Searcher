//
//  ViewController.swift
//  Movies Searcher
//
//  Created by Adwait Barkale on 07/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit
import SafariServices


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
        let query = text.replacingOccurrences(of: " ", with: "%20")
        let strURL = "https://www.omdbapi.com/?apikey=4acadd1&s=\(query)&type=movie"
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
        let cell = tableListMovies.dequeueReusableCell(withIdentifier: "MovieListViewCell") as! MovieListViewCell
        cell.imgPoster.fetchImage(fromURL: arrMovie[indexPath.row].Poster)
        cell.lblMovieName.text = arrMovie[indexPath.row].Title
        cell.lblYear.text = arrMovie[indexPath.row].Year
        cell.lblType.text = arrMovie[indexPath.row]._Type
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let query = URL(string: "https://www.imdb.com/title/\(arrMovie[indexPath.row].imdbID)")
        let nextVC = SFSafariViewController(url: query!)
        present(nextVC,animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}


