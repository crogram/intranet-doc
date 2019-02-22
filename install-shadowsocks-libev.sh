# 编译环境准备&安装依赖包
yum install -y gcc gettext libtool automake make asciidoc xmlto c-ares-devel libev-devel git libsodium-devel mbedtls-devel

# 安装 autoconf
wget ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar zxvf autoconf-2.69.tar.gz
pushd autoconf-2.69
./configure --prefix=/usr/
make && make install
popd

# 克隆源码
git clone --recursive https://github.com/shadowsocks/shadowsocks-libev.git
# 开始编译
pushd shadowsocks-libev
./autogen.sh
./configure --prefix=/usr && make
make install

# 准备必须的文件
mkdir -p /etc/shadowsocks-libev
cp ./rpm/SOURCES/etc/init.d/shadowsocks-libev /etc/init.d/shadowsocks-libev
chmod +x /etc/init.d/shadowsocks-libev

# 编辑配置文件
cp ./debian/config.json /etc/shadowsocks-libev/config.json
# vim /etc/shadowsocks-libev/config.json
cat <<-EOF > /etc/shadowsocks-libev/config.json
{
    "server": "0.0.0.0",
    "server_port": 443,
    "password": "1234567890",
    "method": "aes-256-cfb",
    "mode": "tcp_and_udp"
}
EOF
popd

# 添加开机自启动服务
chkconfig --add shadowsocks-libev
chkconfig shadowsocks-libev on
# 启动服务
service shadowsocks-libev start