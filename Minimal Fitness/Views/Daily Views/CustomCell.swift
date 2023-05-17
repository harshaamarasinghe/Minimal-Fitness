import UIKit
import SnapKit

class CustomCell: UITableViewCell {

    static let identifier = "ClassName"
    
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
        label.font = .systemFont(ofSize: 24, weight: .medium)
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
    
    func configure(with image: UIImage, and label: String){
        self.myImageView.image = image
        self.myLabel.text = label
    }
    
    
    private func setupUI(){
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(myLabel)
        
        //Constraints
        
        myImageView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.layoutMarginsGuide.snp.top)
            make.bottom.equalTo(self.contentView.layoutMarginsGuide.snp.bottom)
            make.left.equalTo(self.contentView.layoutMarginsGuide.snp.left)
            make.size.equalTo(CGSize(width: 90, height: 90))
        }
        
        myLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.layoutMarginsGuide.snp.top)
            make.bottom.equalTo(self.contentView.layoutMarginsGuide.snp.bottom)
            
            make.left.equalTo(self.myImageView.snp.right).offset(20)
            make.right.equalTo(self.contentView.layoutMarginsGuide.snp.right).offset(12)
        }
    }
}
