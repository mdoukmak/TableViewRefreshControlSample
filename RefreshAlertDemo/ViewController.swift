//
//  ViewController.swift
//  RefreshAlertDemo
//
//  Created by Muhammad Doukmak on 10/20/21.
//

import UIKit

class ViewController: UITableViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refresh()
    }
    
    @objc private func refresh() {
        refreshControl?.beginRefreshing()
        Loader.fetch(completion: { [weak self] result in
            self?.refreshControl?.endRefreshing()
            switch result {
            case .success(_):
                break
            case .failure(let error):
//                print("error \(error.localizedDescription)")
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                self?.show(alert, sender: self)
            }
        })
    }

}

public class Loader {
    public static func fetch(completion: @escaping (Result<Int, Error>) -> ()) {
        let error = NSError(domain: "Domain", code: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            completion(.failure(error))
        }
    }
}

