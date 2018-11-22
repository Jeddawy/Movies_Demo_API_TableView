//
//  ViewController.swift
//  Movies
//
//  Created by Ibrahim El-geddawy on 6/26/18.
//  Copyright © 2018 Jiddawi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let reuseIdentefire = "MovieTableViewCell"
    var isLoading = false //to prevent using refreshing while data still loading
    var movieArr = [Movie]()
    lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewDel()
        print("<---------VIEW DID LOAD")
        self.handleRefresh()
        tableView.addSubview(refresher)
        
    }
    
    func tableViewDel(){
        tableView.register(UINib.init(nibName: reuseIdentefire, bundle: nil), forCellReuseIdentifier: reuseIdentefire)
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc private func handleRefresh(){
        refresher.endRefreshing()
//        self.isLoading = false
        APIManager.loadMovies { (error, movies) in
            if self.isLoading  {print("wait"); return}

            self.isLoading = true
            if error != nil {
                print(error?.localizedDescription)
            } else if let movies = movies{
                self.movieArr = movies
                self.tableView.reloadData()
                print(self.movieArr.count)
            }
            self.isLoading = false
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("<---- movies cou", self.movieArr.count)
        print("-------------------------------------")
        return self.movieArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentefire, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(movie: self.movieArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}

