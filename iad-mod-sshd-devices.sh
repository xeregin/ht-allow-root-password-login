for i in `cat devices | awk '{print $1}'`; do
    ht $i -s sshd-allow-root-password-login.sh --sudo-make-me-a-sandwich
done
