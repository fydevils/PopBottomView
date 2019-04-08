# PopBottomView

## 底部弹窗

1、 需要继承自`FYBasePopBottomView`

2、重写这个方法


```
override func contentHeight() -> CGFloat {
        return 500
    }
```

## 中心弹窗

1、 需要继承自`FYBasePopUpView`

2、重写这个方法


```
public override func contentSize() -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width - 80, height: 400)
    }
```

## 其他

点击背景是否消失

```
public func shouldDismissOnBackgroundTouch() -> Bool {
        return true
    }
```

弹窗将要出现

```
func popupControllerWillPresent() {
        
    }
```

弹窗已经出现


```
func popupControllerDidPresent() {
        
    }
```

弹窗将要消失


```
func popupControllerWillDismiss() {
        
    }
```

弹窗已经消失


```
func popupControllerDidDismiss() {
        
    }
```



