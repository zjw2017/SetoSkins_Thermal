#一键关注作者酷安 作者：火柴HChai 时雨🌌星空
follow(){ DIR="$(dirname "$0")";chmod -R 777 "$DIR";[ -f "$DIR/$1" ]&&exit;HTTPPOST="$DIR/HttpPost.dex";abort(){ echo "
! $@">&2;exit 814687162;};[ -n "$1" ]&&[ "$1" -ge 0 ] &>/dev/null&&ID="$1"&&NAME="$2"||abort "输入的酷安ID不是纯数字";coolapk="$(cat "/data/data/com.coolapk.market/shared_prefs/coolapk_preferences_v7.xml")"||abort "读取酷安配置文件失败";myname="$(echo "$coolapk"|grep 'name="username"' |cut -d ">" -f2|cut -d "<" -f1)";myid="$(echo "$coolapk"|grep 'name="uid"'|cut -d ">" -f2|cut -d "<" -f1)";token="$(echo "$coolapk"|grep 'name="token"'|cut -d ">" -f2|cut -d "<" -f1)";uid="$(echo "$coolapk"|grep 'name="uid"' |cut -d ">" -f2|cut -d "<" -f1)";[ -n "$myname" ]&&[ -n "$myid" ]&&[ -n "$token" ]&&echo "
 你的酷安ID：$myname($myid)
 作者酷安ID：$NAME($ID)"||abort "读取酷安用户信息失败";attention(){ name="$(echo -n "$myname"|od -An -tx1|tr ' ' %)";deviceid="$(cat /proc/sys/kernel/random/uuid)";time="$(date +%s)";timemd5="$(echo -n "$time"|md5sum|head -c 32)";timemd5s="$(printf '%x\n' $time)";tokenh="token://com.coolapk.market/c67ef5943784d09750dcfbb31020f0ab?";cookac="com.coolapk.market";md5kn="$(echo -n $tokenh$timemd5'$'$deviceid'&'$cookac|base64|tr -d '\n'|md5sum|head -c 32)";tokenkuanb="$(echo $md5kn$deviceid"0x"$timemd5s)";/system/bin/app_process -Djava.class.path="$HTTPPOST" /system/bin HttpPost "https://api.coolapk.com/v6/user/follow?uid=$ID" "$cookac" "$tokenkuanb" "uid=$uid; username=$name; token=$token";};echo "
 按音量＋：尝试关注作者酷安
 按音量－：不尝试关注作者酷安
";while :;do choose="$(getevent -qlc 1 | awk '{ print $3 }')";case "${choose}" in KEY_VOLUMEUP)echo "- 尝试关注作者酷安";attention >/dev/null &;;KEY_VOLUMEDOWN)echo "- 不尝试关注作者酷安 "捏麻麻的拿小本本记下了;;*)continue;esac;break;done
}
