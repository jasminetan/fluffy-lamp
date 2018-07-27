//
//  TasksTableViewCell.swift
//  Tasks
//
//  Created by Jasmine Tan on 7/27/18.
//  Copyright © 2018 Jasmine Tan. All rights reserved.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
