//
//  PhotoListViewController.swift
//  PhotosList
//
//  Created by admin on 25.05.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol ListOfPhotosProtocol: class {
    
}

class PhotoListViewController: UIViewController, ListOfPhotosProtocol  {
        
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListOfPhotosPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = presenter.title
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
}

extension PhotoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.myPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.presenter.reusableIdentifier)!
        cell.textLabel?.text = self.presenter.getNameOfPhoto(atIndex: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.preparePush(atIndex: indexPath.row)
    }
}
