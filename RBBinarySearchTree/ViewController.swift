//
//  ViewController.swift
//  RBBinarySearchTree
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var outputTextView: UITextView!
    @IBOutlet var constraintWidthOutputTextView: NSLayoutConstraint!
    @IBOutlet var constraintHeightOutputTextView: NSLayoutConstraint!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!

    var tree = BinarySearchTree<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()

        reloadOuput()
    }

    @IBAction func insertNewValue(_ sender: Any?) {
        guard let value = inputTextField.text, let valueInt = Int(value) else { return }
        tree.insert(valueInt)
        reloadOuput()
        inputTextField.text = ""
    }

    @IBAction func deleteValue(_ sender: Any?) {
        guard let value = inputTextField.text, let valueInt = Int(value) else { return }
        tree.delete(valueInt)
        reloadOuput()
        inputTextField.text = ""
    }

    private func reloadOuput() {
        let text = tree.horizantalOrder(space: 0)

        let maxSize = CGSize(width: 9999999, height: 999999)
        var newSize = (text as NSString).boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: outputTextView.font!], context: nil)
        newSize = CGRect(x: newSize.origin.x, y: newSize.origin.y, width: newSize.width + 100, height: newSize.height + 100)

        constraintWidthOutputTextView.constant = newSize.width
        constraintHeightOutputTextView.constant = newSize.height

        scrollView.contentSize = newSize.size

        outputTextView.text = text
    }
}

