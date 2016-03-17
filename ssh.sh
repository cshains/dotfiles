# #!/bin/sh

# if grep -q "Host castest casapps casapps2 iadvise" "/etc/ssh_config";
# then
#    printf '\033[0;34m%s\033[0m\n' "ssh_config already configured."
# else
#     printf '\033[0;34m%s\033[0m\n' "Configuring ssh_config..."
#     sudo bash -c "echo Host castest casapps casapps2 iadvise >> /etc/ssh_config"
#     sudo bash -c "echo HostName %h.csspt.nor.ou.edu >> /etc/ssh_config"
#     sudo bash -c "echo User mccn >> /etc/ssh_config"
# fi
