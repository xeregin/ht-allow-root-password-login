for i in `cat devices | sed '/bad/d' | awk '{print $2}'`; do
    sshpass -p 'insecure' scp -o StrictHostKeyChecking=no sshd-allow-root-password-login.sh ubuntu@$i:~
    sshpass -p 'insecure' ssh -o StrictHostKeyChecking=no ubuntu@$i 'chmod u+x sshd-allow-root-password-login.sh'
    sshpass -p 'insecure' ssh -o StrictHostKeyChecking=no ubuntu@$i '~/sshd-allow-root-password-login.sh'
done
