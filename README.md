# NImbleKit
A nimble way to setup View by Swift.  Say goodbye to "=".

More flexible and convenient

## CocoaPods

`pod 'NimbleKit'`

## Setup a button
### before

```
let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
editButton.setTitle("编辑", for: .normal)
editButton.setTitle("完成", for: .selected)
editButton.setTitleColor(UIColor.red, for: .normal)
editButton.setTitleColor(UIColor.brown, for: .selected)
editButton.backgroundColor = UIColor.red
editButton.layer.cornerRadius = 10
editButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
....
```

### after

```
let editButton = UIButton().nb
	.frameRect(0, 0, 50, 50)
	.title("编辑")
	.title("完成", state: .selected)
	.titleColor(UIColor.red)
	.titleColor(UIColor.brown, state: .selected)
	.backgroundColor(UIColor.red)
	.cornerRadius(10).base
	.whenTap { 
	  // clickButtonAction
	}
	....
```

Don't need more assignment operation.

### before

```

## setup a TableView now:
```
tableView.nb.separator(style: .none)
    .backgroundColor(UIColor.Common.grayF7F7F7)
    .register(UINib(nibName: cellID, bundle: nil), cellIdentifier: cellID)
    .register(MineBonusMsgCell.self, cellIdentifier: msgCellID)
    .sectionHeaderHeight { _ in 15 }
    .rowHeightOf { wSelf.vm.rowHeight(of: $0) } // 返回行高
    .didSelect { wSelf.vm.handleClickBonusItem($0) } // 点击某一行cell
    .dataSource(wSelf.vm)
    .addToSuperView(self.view)
```

## Adjust a view position


### Sometimes you need do this

```
let view = UIView()
view.frame.size.width = 100
view.frame.size.height = 100
view.center.x = 150
view.center.y = 150
```

### now, for any UIView

```
view.nb.width(100).height(100).centerX(150).centerY(150).base
```

## Create a label as member

class ViewController: UIViewController {

/// property
var label: UILabel = {
    let tmp = UILabel()
    tmp.textColor = .white
    tmp.text = "aaa"
    ...
    return tmp
}()

override func viewDidLoad() {
}
```

### after
```
class ViewController: UIViewController {

let label = UILabel().nb.textColor(.white).text("aaa").base

override func viewDidLoad() {
}
```
