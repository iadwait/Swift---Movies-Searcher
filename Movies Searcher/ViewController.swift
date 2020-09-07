//
//  ViewController.swift
//  Movies Searcher
//
//  Created by Adwait Barkale on 07/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

struct Movie {
    
}

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

