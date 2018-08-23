//
//  DetailViewController.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var detailLabel: UILabel!
    var article: ArticleViewModel? {
        didSet {
            refreshUI()
        }
    }
    func refreshUI() {
        loadViewIfNeeded()
        if let art = article, let abstractString = art.abstract {
             detailLabel.text = abstractString
        }
    }
}

extension DetailViewController: MasterTableViewSelectionDelegate {
    func articleSelected(_ articleDetail: ArticleViewModel?) {
        if let detail = articleDetail {
            article = detail
        }
    }
}
