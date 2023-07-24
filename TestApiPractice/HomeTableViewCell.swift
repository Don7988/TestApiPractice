//
//  HomeTableViewCell.swift
//  APIPractice
//
//  Created by Don Dominic on 24/07/23.
//
import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblWidth: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    
    var dataModel: [DataModel] = []
    var cellModel: ViewModel! {
        didSet{
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(){
        switch cellModel.homeCellType{
            
        case .homeCell:
            lblID.text = cellModel.dataModel.id
            lblWidth.text = cellModel.dataModel.author
            lblHeight.text = cellModel.dataModel.height?.description
            if let imageUrl = URL(string: cellModel.dataModel.download_url ?? "") {
                JMImageCache.shared().image(for: imageUrl) { image in
                    self.displayImage.image = image
                } failureBlock: { _, _, error in
                    self.displayImage.image = UIImage(named: "")
                }
            }
        }
    }
}
