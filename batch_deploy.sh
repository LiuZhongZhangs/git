
#!/bin/sh
read -p "Please Enter insert Source File or DIR: " src_file
echo ======================================================
sleep 1
read -p "Please Enter insert Destination DIR: " des_dir
for id in `awk '{print $6}' passwd.md`
do 
    ### username
    j=`awk -v I="$id"  '{if(I==$6)print $1}' passwd.md`
    ### ip
    i=`awk -v I="$id"  '{if(I==$6)print $2}' passwd.md`
    ### password
    k=`awk -v I="$id" '{if(I==$6)print $3}' passwd.md`
    ### port
    p=`awk -v I="$id"  '{if(I==$6)print $4}' passwd.md`
    expect batch_deploy.scp  $j  $i  $k  $p  $src_file $des_dir
done
