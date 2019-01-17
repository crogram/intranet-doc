# 使用 acme.sh 申请 Let’s Encrypt 域名证书

**如何使用 acme.sh**，这里从 GitHub 下载安装

下载 acme.sh

```shell
git clone https://github.com/Neilpang/acme.sh.git
```

安装 acme.sh，这里指定安装到目录 /usr/local/acme.sh，其它相关参数请参照官方文档

```shell
cd acme.sh
./acme.sh --install \
--home /usr/local/acme.sh \
--cert-home  /usr/local/acme.sh/certs-list \
--useragent  "the Intranet Panel"
```

使用 acme.sh 命令，需要重载 .bashrc 或重新登陆使命令 acme.sh 生效，或者直接使用绝对路径命令 `/usr/local/acme.sh/acme.sh`

```shell
source ~/.bashrc
```

更新 acme.sh

目前由于 acme 协议和 letsencrypt CA 都在频繁的更新, 因此 acme.sh 也经常更新以保持同步

升级 acme.sh 到最新版

```shell
acme.sh --upgrade
```

开启自动升级，然后, acme.sh 就会自动保持更新了

```shell
acme.sh --upgrade --auto-upgrade
```

关闭自动更新

```shell
acme.sh --upgrade --auto-upgrade 0
```

卸载 acme.sh

```shell
acme.sh --uninstall
```



**如何用 acme.sh 签发证书**

```shell
# 利用文件路径访问的方式验证域名
acme.sh --issue -d github.com --webroot /home/www/github.com/

# 利用已安装 Apache 验证域名
acme.sh --issue -d github.com --apache

# 利用已安装 Nginx 验证域名
acme.sh --issue -d github.com --nginx

# 利用脚本自带的 webserver 验证域名
acme.sh --issue -d github.com --standalone

# 单个域名签发证书
acme.sh --issue --dns dns_cf -d github.com

# 多个域名签发证书，添加多个 -d 参数
acme.sh --issue --dns dns_cf -d github.com -d www.github.com  -d test.github.com

# 泛域名签发证书
acme.sh --issue --dns dns_cf -d *.github.com

```

发布证书，将证书复制到服务器指定配置目录

```shell
acme.sh --installcert -d github.com \
		--key-file /etc/nginx/ssl/github.com.key \
		--fullchain-file /etc/nginx/ssl/github.com.cer \
		--reloadcmd "service nginx force-reload"
```

安装证书，将证书部署到服务器，将配置信息写入对应域名配置文件，下面是 nginx 配置

```nginx
server {
    listen 443 ssl;
	server_name github.com www.github.com;
    ssl on;
    ssl_certificate      /etc/nginx/ssl/github.com.cer;
    ssl_certificate_key  /etc/nginx/ssl/github.com.key;
}
```

