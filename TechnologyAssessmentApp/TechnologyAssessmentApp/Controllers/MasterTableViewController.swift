//
//  MasterTableViewController.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD

// swiftlint:disable vertical_parameter_alignment

//
// MARK: Protocol Defination
//

protocol MasterTableViewSelectionDelegate: class {
    func articleSelected(_ articleDetail: ArticleViewModel?)
}

class MasterTableViewController: UITableViewController {
    //
    // MARK: Properties
    //
    var isDetailViewController: Bool = true
    var viewModels = [ArticleViewModel]()

    weak var delegate: MasterTableViewSelectionDelegate?
    fileprivate var articleDataSource: ArticleDataSource?
    fileprivate var selectedIndexPath: IndexPath?
    //
    // MARK: View Controller Methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assign the split view controller delegate to the MasterTableViewController
        splitViewController?.delegate = self
        //to preserve selection between presentations
        clearsSelectionOnViewWillAppear = false
        // Tableview setup
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 115
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.accessibilityIdentifier = "table--articleTableView"
        // Network Call
        fetchArticleList()
    }
    //
    // MARK: Memory Managment
    //
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    // MARK: - Public Methods
    //
    func showAlertWith(title: String?, message: String?, completion: (() -> Swift.Void)? = nil) {
        let alertConteroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .default) { (_) in
            completion?()
        }
        alertConteroller.addAction(actionOk)
        present(alertConteroller, animated: true, completion: nil)
    }
    //
    // MARK: - Network Methods
    //
    func fetchArticleList() {
        
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Fetching articles..."
        
        // Check Internet Connectivity
        if Reachability.isConnectedToNetwork() == true {
            AppApiManager().getArticlesList { [weak self] (response, customError) in
                if let strongSelf = self {
                    MBProgressHUD.hide(for: strongSelf.view, animated: true)
                    if customError != nil {
                        // Display error alert with usage of unowned self that an error is present
                        strongSelf.showAlertWith(title: nil, message: customError?.description)
                    } else {
                        if let res = response {
                            strongSelf.tableView.isHidden = false
                            strongSelf.viewModels = res
                            strongSelf.articleDataSource = strongSelf.setUpDataSource()
                        }
                    }
                }
            }
        } else {
            showAlertWith(title: nil, message: UIMessages.noInternet)

        }
    }
}
extension MasterTableViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController,
         collapseSecondary secondaryViewController: UIViewController,
         onto primaryViewController: UIViewController) -> Bool {
                                return isDetailViewController
                            }
}

// MARK: - Data Source
class ArticleDataSource: CollectionArrayDataSource<ArticleViewModel, ArticleTableViewCell> {}

// MARK: - Private Methods
fileprivate extension MasterTableViewController {
    func setUpDataSource() -> ArticleDataSource? {
        let dataSource = ArticleDataSource(tableView: tableView, array: viewModels)
        dataSource.tableRowSelectionHandler = { [weak self] indexpath in
            guard  let strongSelf = self else { return }
            strongSelf.selectedIndexPath  = indexpath
            let viewModel = strongSelf.articleDataSource?.row(at: indexpath)

           strongSelf.delegate?.articleSelected(viewModel)
           strongSelf.isDetailViewController = false
            if let detailViewController = strongSelf.delegate as? DetailViewController,
                let detailNavigationController = detailViewController.navigationController {
                strongSelf.splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
            }
        }
        return dataSource
    }
}
