[‼️]: ✏️README.mdt

# 收到邮件，推送消息到微信、浏览器

## 代码库

* [GITHUB](https://github.com/3TiSite/mailhook)
* [开放原子](https://atomgit.com/3ti/mailhook)

## 环境变量

参考 [.env.example](./.env.example) 配置环境变量

```dotenv
WARN_URL=https://groups.google.com/your_group

WXPUSH_TOKEN=
WXPUSH_ID=
HOST=3Ti
PORT=8080

RUST_BACKTRACE=short
RUST_LOG=debug,supervisor=warn,hyper=warn,rustls=warn,h2=warn,tower=warn,reqwest=warn,watchexec=warn,globset=warn
```

其中 HOST 只是提醒的前缀，可以随意修改。

## 推送

注册 [wxpusher](https://wxpusher.zjiecode.com)，创建频道关注微信公众号 (提醒效果如下图)。

![](https://i-01.eu.org/2023/12/eCca5i_.webp)

wxpusher 会生成一个二维码图片链接，扫描关注即可收到提醒。

单个微信用户，每天最多接收 2000 条消息，请合理安排发送频率。

推荐安装 [WxPusher Chrome 插件](https://github.com/wxpusher/wxpusher-chrome-extensions)，开着浏览器即可收到推送消息。

## 部署

可以用任何环境部署，`cargo install mailhook` 就可以安装。

如下图， [推荐用 google cloud run 部署](https://console.cloud.google.com/run/create)。

![](https://i-01.eu.org/2023/12/PpzKyXU.webp)

建议复刻本仓库，让 cloud run 与 github 代码库集成，自动构建部署

配置参数如下， 内存 128MB ，CPU 选 1 ，并发 80，端口用 8080 即可，允许未经身份验证的访问，在请求期间仅分配 CPU 。

Google Cloud Run 免费配额如下，足够用了：

* CPU : 每月前 18 万 vCPU 秒
* 内存 : 每月前 36 万 GiB 秒
* 请求 : 每月免费：200 万个请求

## 收信触发

注册 [proxiedmail.com](https://proxiedmail.com)

建议直接转发到 [Google Groups](https://groups.google.com) 方便查看。

配置收到邮件的 [webhook](https://proxiedmail.com/en/webhook-on-email) (这个页面需要**退出**登录才能访问)

webhook 地址直接写上面 cloud run 的网址。

![](https://i-01.eu.org/2023/12/3O_ZU1h.webp)
