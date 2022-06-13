#!/bin/env bash
while true

do
    sleep 3
    #循环查看占用cpu超过90%的进程ID
    /bin/ps axf -o "pid %cpu" | awk '{if($2>=90) print $1}' | while read procid
    do
        #进程详细信息
        pro=$(ps -A|grep "\<$procid\>" |sort -k3,3|head -n1)
        #获取进程运行的时间，如果大于15秒，设time为1，如若不是则设time为0
        time="$(echo $pro|awk '{split($3,tab,/:/); if (tab[3]>=15) {print 1}else{print 0}}')"
        #如果time1，则kill掉该进程
        if [ $time = '1' ];then
            kill -9 $procid
        fi
    done
done
