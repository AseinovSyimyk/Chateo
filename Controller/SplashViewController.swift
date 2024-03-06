import UIKit
import SnapKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "SplashImage"))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        // Симуляция какой-либо загрузки с помощью задержки
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // После задержки переходим на следующий экран
            let loginViewController = LoginViewController()
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
}
