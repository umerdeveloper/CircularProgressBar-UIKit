

import UIKit

class ViewController: UIViewController {
    
    var circularCharactersCounterView = CircularCharactersCounterView()
    var circularCharactersCounterTopLayerView = CircularCharactersCounterTopLayerView()
    
    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.delegate = self
        setupCircularCharactersCounterTopLayerView()
        setupCircularCharactersCounterView()
    }
    
    private func setupCircularCharactersCounterTopLayerView() {
        view.addSubview(circularCharactersCounterTopLayerView)
        circularCharactersCounterTopLayerView.translatesAutoresizingMaskIntoConstraints = false
        circularCharactersCounterTopLayerView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        circularCharactersCounterTopLayerView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        circularCharactersCounterTopLayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        circularCharactersCounterTopLayerView.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 20).isActive = true
    }
    
    private func setupCircularCharactersCounterView() {
        circularCharactersCounterTopLayerView.addSubview(circularCharactersCounterView)
        
        circularCharactersCounterView.translatesAutoresizingMaskIntoConstraints = false
        
        circularCharactersCounterView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        circularCharactersCounterView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        circularCharactersCounterView.centerXAnchor.constraint(equalTo: circularCharactersCounterTopLayerView.centerXAnchor).isActive = true
        circularCharactersCounterView.centerYAnchor.constraint(equalTo: circularCharactersCounterTopLayerView.centerYAnchor).isActive = true
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        if let text = textView.text {
            circularCharactersCounterView.setProgressWithAnimation(numberOfCharacters: text.count)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        textView.text.count + (text.count - range.length) < 1000
    }
}

