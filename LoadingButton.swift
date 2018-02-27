import UIKit
class LoadingButton:UIButton {
    
    
    private var originalButtonText: String?
    private var activityIndicator: UIActivityIndicatorView!
    
    private var originalButtonColor:UIColor?
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
     }
    
    
    func showLoading() {
        originalButtonText = self.titleLabel?.text
        
        originalButtonColor = self.backgroundColor
        
        self.setTitle("  \(_language.Select("Loading"))...", for: UIControlState.normal)
        
        self.backgroundColor = UIColor.lightGray
        
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        
        self.isEnabled = false
        
        showSpinning()
    }
    
    func complete() {
        
        self.setTitle("  Complete...", for: UIControlState.normal)
        
        self.backgroundColor = UIColor.lightGray
        
        self.setTitle(originalButtonText, for: UIControlState.normal)
        activityIndicator.stopAnimating()
        
        self.isEnabled = false
        
    }
    
    func hideLoading() {
        
        if self.isEnabled == false {
            
            self.backgroundColor = originalButtonColor
            
            self.setTitle(originalButtonText, for: UIControlState.normal)
            activityIndicator.stopAnimating()
            
            self.isEnabled = true
            
        }
        
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.white
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1.35, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
    
}
