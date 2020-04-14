## 帮助说明

baklib官网：[https://www.baklib.com/](https://www.baklib.com/)

### 安装所需包

```shell
bundle
```

### 文件说明

**config.rb**

需要配置的参数，其中token值获取参见[API开发文档](https://guide.baklib.com/f3e7/2751)

**baklib_api.rb**
目前baklib对外开放的接口，都存放在了这个文件里面

**client.rb**
api接口访问入口文件，可以再这里面调用任意已存在的方法

### 运行代码

```shell
ruby client.rb
```
