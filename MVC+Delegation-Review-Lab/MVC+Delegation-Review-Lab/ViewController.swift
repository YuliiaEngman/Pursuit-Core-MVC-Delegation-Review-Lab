//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var fontSize: CGFloat = 17 {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        movies = Movie.allMovies
        fontSize = CGFloat(17.0)
    }
    
    
    @IBAction func changeMovieFont(segue: UIStoryboardSegue) {
        //    guard let fontChangingVC = segue.source as? FontChangerController else {
        //        fatalError("failed to access CreateEventController")
        //    }
        //
        //    fontSize = fontChangingVC.sliderFont
        //
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fontVC = segue.destination as? FontChangerController
            //let indexPath = tableView.indexPathForSelectedRow
            else {
                fatalError("failed to get indexPath and fontChangingVC")
        }
        //let font = fontSize
        
        fontVC.sliderFont = Float(fontSize)
        fontVC.font = Double(fontSize)
        fontVC.delegate = self
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.textLabel?.font = UIFont(name: "Didot", size: CGFloat(fontSize))
        cell.detailTextLabel?.font = UIFont(name: "Didot", size: CGFloat(fontSize))
        return cell
    }
}

extension ViewController: FontSize {
    func changeSize(_ fontVC: FontChangerController, fontSize: Float) {
        self.fontSize = CGFloat(fontSize)
    }
}

