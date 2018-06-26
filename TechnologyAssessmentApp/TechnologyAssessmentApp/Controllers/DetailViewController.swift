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
    
    
    var articleDetail: [String:Any]?
    {
        didSet
        {
            refreshUI()
        }
    }
    
    func refreshUI()
    {
        loadViewIfNeeded()
        
        if let dict = self.articleDetail,let abstractString = dict["abstract"] as? String
        {
             self.detailLabel.text = abstractString
            
        }

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: ArticleSelectionDelegate
{
    func articleSelected(_ articleDetail: [String : Any]?)
    {
        
        if let detail = articleDetail
        {
            self.articleDetail = detail
        }
        
    }
    
}

