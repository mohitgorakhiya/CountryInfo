//
//  ViewController.swift
//  CountryInfo
//
//  Created by Mohit Gorakhiya on 1/15/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CountryViewController: UIViewController {

    var countryTableView: UITableView!
    let countrySource = CountryDataSource()
    var refreshButton: UIBarButtonItem!
    var activityIndicatorItem: UIBarButtonItem!

    lazy var countryViewModel: CountryViewModel = {
        let countryViewModel = CountryViewModel.init(PlaceAPIService(), dataSource: countrySource)
        return countryViewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = Constant.appTitle
        self.setRightBarbButton()
        self.setUpTableView()
        self.fetchCountryPlaceInfo()
    }

    // Set Right bar button for Refresh the list
    func setRightBarbButton() {

        refreshButton = UIBarButtonItem.init(barButtonSystemItem: .refresh,
                                             target: self,
                                             action: #selector(refreshInfo))
        let activityIndicator = UIActivityIndicatorView.init(style: .gray)
        activityIndicator.frame = CGRect.init(x: 0.0, y: 0.0, width: 20.0, height: 20.0)
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        activityIndicatorItem = UIBarButtonItem.init(customView: activityIndicator)

        self.navigationItem.rightBarButtonItem = refreshButton
    }

    // Add Table view and set up constraint
    func setUpTableView() {

        countryTableView = UITableView()
        countryTableView.backgroundColor = .white
        self.view.addSubview(countryTableView)
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        countryTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        countryTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        countryTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        countryTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.countryTableView.dataSource = self.countrySource
        self.countrySource.data.addAndNotify(observer: self) { [weak self] in
            self?.countryTableView.reloadData()
        }
        self.countryTableView.tableFooterView = UIView(frame: .zero)
        self.countryTableView.estimatedRowHeight = 100
        self.countryTableView.rowHeight = UITableView.automaticDimension
    }

    // Toggle right bar button when API calling is in progress and finish
    func toggleRightBarButton(isAPICallFinish: Bool) {

        self.navigationItem.rightBarButtonItem = nil
        if isAPICallFinish {
            self.navigationItem.rightBarButtonItem = refreshButton
        } else {
            self.navigationItem.rightBarButtonItem = activityIndicatorItem
        }
    }

    @objc func refreshInfo() {
        self.fetchCountryPlaceInfo()
    }

    func fetchCountryPlaceInfo() {
        if Connectivity.isConnectedToInternet() {
            self.toggleRightBarButton(isAPICallFinish: false)
            countryViewModel.fetchPlaceInfo { (success, title, _) in

                DispatchQueue.main.async {
                    if success {
                        self.navigationItem.title = title
                    } else {
                        self.showAlert(msg: Constant.errorMessage, completion: nil)
                    }
                    self.toggleRightBarButton(isAPICallFinish: true)
                }
            }
        } else {
            self.showAlert(msg: Constant.noInternetMessage, completion: nil)
            self.toggleRightBarButton(isAPICallFinish: true)
        }
    }
}
