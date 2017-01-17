filename=`ls -ltr | grep ^- | tail -1 | awk '{ print $(NF) }'` ## get last file added or modify
smbclient -U <username>%'<pass>' //<هح>/backup --directory \<directory_name>  -c "put "${filename}"" ## send to windows file sharing
