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
    
    var fontSize = 17.0 {
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
    }
    

@IBAction func changeMovieFont(segue: UIStoryboardSegue) {
    // caveman debugging  print("adding event....")
    guard let fontChangingVC = segue.source as? FontChangerController else {
        //        let createdEvent = createEventController.event else {
        fatalError("failed to access CreateEventController")
    }
    
    fontSize = fontChangingVC.stepperFont
    
//    movies = fontChangingVC.movie
    //    // insert into our events array
    //    events.insert(createdEvent, at: 0) // implies top of the events array
    
    // create an indexPathto be inserted into the tableView
    //let indexPath = IndexPath(row: 0, section: 0) // will represent top of table view
    
    // use indexPath to insert table view
    //    tableView.insertRows(at: [indexPath], with: .automatic)
}

//@IBAction func updateUIFromUnwindSegue(segue: UIStoryboardSegue) {
//     // we need access to the source destination view controller
//     guard let detailViewController = segue.source as? DetailViewController else {
//         return
//     }
//     event = detailViewController.event
//     // after event is set here, didSet{...} on the vent property gets called
//     // and the UI (user interface) is updated
//     // ui elements that gets updated are the rspcLabel text and  cfreateEventButton's titleLabel
// }

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
        return cell
    }
}
