import UIKit
import SnapKit

class ScheduleCustomCell: UITableViewCell {

    static let identifier = "ScheduleCustomCell"
    
    private let myImageView : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "questionmark")
        image.tintColor = .label
        return image
    }()
    
    private let myLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.text = "Error"
        return label
    }()
    
    private let myLabelMini : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.numberOfLines = 0
        label.text = "Error"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Configuring Table
    
    func configure(with image: UIImage, label: String, labelMini:String){
        self.myImageView.image = image
        self.myLabel.text = label
        self.myLabelMini.text = labelMini
    }
    
    
    private func setupUI(){
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(myLabel)
        self.contentView.addSubview(myLabelMini)
        
        //Constraints
        
        myImageView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.layoutMarginsGuide.snp.top)
            make.bottom.equalTo(self.contentView.layoutMarginsGuide.snp.bottom)
            make.left.equalTo(self.contentView.layoutMarginsGuide.snp.left)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        myLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(self.myImageView.snp.right).offset(20)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
            
        }
        
        myLabelMini.snp.makeConstraints { make in
            make.top.equalTo(myLabel.snp.top).offset(10)
            make.bottom.equalTo(self.contentView.layoutMarginsGuide.snp.bottom)
            make.left.equalTo(self.myImageView.snp.right).offset(20)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
        }
    }
}
