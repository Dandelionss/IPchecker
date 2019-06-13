#!/bin/bash
#按格式将ip填入iplist中
ip=('x.x.x.x' 'xx.xx.xx.xx')
#需要检测几个IP就在上方填入几个IP。
#写入Server酱的秘钥
#Server酱地址http://sc.ftqq.com/3.version  github账号登入即可获取秘钥，详情请看使用准则
ft_sckey="xxxxxxxxxxxxxxxxxxxxxxxxxx"
ipcheck()
{
if [ $(curl -s https://ipcheck.need.sh/api_v2.php?ip=$1 | awk -F '[:}]' '{print $21}') = true ] ; 
then 
echo -e "恭喜，您的小鸡$1还活着！"
else
echo -e "正在准备进行第二次检测哦。"
sleep 1
ipcheck_two $1
fi
}
ipcheck_two()
{
if [ $(curl -s https://ipcheck.need.sh/api_v2.php?ip=$1 | awk -F '[:}]' '{print $21}') = true ] ; 
then 
echo -e "恭喜，您的小鸡$1还活着！"
else
echo -e "正在准备进行第三次检测哦。"
sleep 1
ipcheck_three $1
fi 
}
ipcheck_three()
{
if [ $(curl -s https://ipcheck.need.sh/api_v2.php?ip=$1 | awk -F '[:}]' '{print $21}') = true ] ; 
then 
echo -e "恭喜，您的小鸡$1还活着！"
else
echo -e "糟糕！您的小鸡$1挂了！"
wget https://sc.ftqq.com/$ft_sckey.send?text=我的天呐，您的小鸡鸡$1挂了，赶紧查看下！ -O /dev/null >> /dev/null 2>&1
fi 
}
for(( i=0;i<${#iplist[@]};i++)) do
ipcheck ${iplist[i]}
done;
