import UIKit
import SnapKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "People"))
        view.addSubview(imageView)
        
        let label = UILabel()
        label.text = "Connect easily with\nyour family and friends\nover countries"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 3
        label.textAlignment = .center
        view.addSubview(label)
        
        
        let buttonNextPage = UIButton()
        buttonNextPage.setTitle("Start Messaging", for: .normal)
        buttonNextPage.backgroundColor = .blue
        buttonNextPage.layer.cornerRadius = 26
        buttonNextPage.addTarget(self, action: #selector(buttonNextPageTapped), for: .touchUpInside)
        view.addSubview(buttonNextPage)
        
        let labelPolicy = UILabel()
        labelPolicy.text = "Terms & Privacy Policy"
        labelPolicy.textColor = .gray
        labelPolicy.font = UIFont.systemFont(ofSize: 14)
        labelPolicy.textAlignment = .center
        view.addSubview(labelPolicy)
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(260)
            make.height.equalTo(271)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(130)
        }
        
        label.snp.makeConstraints { make in
            make.width.equalTo(278)
            make.height.equalTo(90)
            make.centerX.equalTo(imageView.snp.centerX)
            make.top.equalTo(imageView.snp.bottom).offset(10)
        }
        
        buttonNextPage.snp.makeConstraints { make in
            make.width.equalTo(328)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
        
        labelPolicy.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(buttonNextPage.snp.top).offset(-25)
        }
        
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @objc func buttonNextPageTapped() {
        let phoneNumberVC = PhoneNumberViewController()
        navigationController?.pushViewController(phoneNumberVC, animated: true)
    }
}
