ssh_oPwd=$OLDPWD
ssh_oUmask=$(umask)
umask 077
ssh_tempdir=$(mktemp -d /tmp/ssh-id-XXXXXXX)
cd $ssh_tempdir || exit 1

ssh_crtFp=$(
    sed -ne "/sshd.$PPID.:.*matching .SA key/{s/^.* //g;h};\${x;p}" /var/log/sshdusers.log
)
for ((ssh_i=1;ssh_i<=$(wc -l <$HOME/.ssh/authorized_keys);ssh_i++));do
    export ssh_line="$(sed -ne ${ssh_i}p <$HOME/.ssh/authorized_keys)"
    echo "$ssh_line" >tempKey
    export ssh_lFp=($(ssh-keygen -l -f tempKey))
    if [ "${ssh_lFp[1]}" == "$ssh_crtFp" ] ;then
        export SSH_KEY_USER=${ssh_line##* }
        break
      fi
  done

cd $OLDPWD
OLDPWD=$ssh_oPwd
rm -fR $ssh_tempdir
umask $ssh_oUmask
unset ssh_lFp ssh_line ssh_i ssh_crtFp ssh_tempdir ssh_oUmask ssh_oPwd
