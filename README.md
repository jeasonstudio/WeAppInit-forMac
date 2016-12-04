# WeAppInit-forMac
为使用 MacOS 的小程序开发者 制作


## weapp.sh 使用方法

`clone`或者`DownLoad`这个项目下的`weapp.sh`文件

将 weapp.sh 文件放在你想建项目的外层，然后打开终端，cd 到该目录下

执行

```bash
./weapp.sh Jeason
```

Jeason 为作者名字，请替换成你的名字。

>若提示无权限请在当前目录下输入`chmod 777 weapp.sh`

若无报错，脚本将自动为你部署好微信小程序的开发目录结构。

## weapp-add.sh 使用方法

此脚本为已有的小程序添加页面用。

`weapp-add.sh` 放到与 `weapp.sh` 同级目录

执行

```bash
./weapp-add.sh Jeason DEMO
```

>第一个参数为作者名字，第二个参数为小程序根目录名

>若提示无权限请在当前目录下输入chmod 777 weapp-add.sh

若无报错，将自动为你添加页面，Have Fun