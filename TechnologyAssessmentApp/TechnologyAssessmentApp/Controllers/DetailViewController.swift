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
        if let art = self.article, let abstractString = art.abstract {
             self.detailLabel.text = abstractString
        }
    }
}

extension DetailViewController: ArticleSelectionDelegate {
    func articleSelected(_ articleDetail: ArticleViewModel?) {
        if let detail = articleDetail {
            self.article = detail
        }
    }
}
