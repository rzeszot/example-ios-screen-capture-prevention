import SwiftUI
import UIKit

final class ContentViewController: UIViewController {

  @objc private func backgroundAction() {
    textField.resignFirstResponder()
  }

  @objc private func switchAction() {
    label.isSecuredCapture = switchView.isOn
    switchView.isSecuredCapture = switchView.isOn

    updateText()
  }

  private func updateText() {
    label.text = label.isSecuredCapture ? "hidden" : "visible"
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemYellow
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backgroundAction)))

    updateText()
  }

  lazy var textField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.backgroundColor = .tertiarySystemBackground
    view.addSubview(textField)
    textField.isSecureTextEntry = true

    textField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100 ),
      textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      textField.heightAnchor.constraint(equalToConstant: 50)
    ])

    return textField
  }()

  lazy var switchView: UISwitch = {
    let switchView = UISwitch()
    switchView.addTarget(self, action: #selector(switchAction), for: .valueChanged)

    view.addSubview(switchView)
    switchView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      switchView.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -20),
      switchView.trailingAnchor.constraint(equalTo: textField.trailingAnchor)
    ])

    return switchView
  }()

  lazy var label: UILabel = {
    let label = UILabel()
    label.backgroundColor = textField.backgroundColor
    label.textColor = textField.textColor

    view.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
      label.trailingAnchor.constraint(equalTo: switchView.leadingAnchor, constant: -10),
      label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor)
    ])

    return label
  }()

}

extension ContentViewController: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> ContentViewController {
    ContentViewController()
  }

  func updateUIViewController(_ vc: ContentViewController, context: Context) {
    // nop
  }
}
