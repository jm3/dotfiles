if ! pgrep -u "$USER" ssh-agent > /dev/null 2>&1; then
  eval $(ssh-agent -s) > /dev/null
  find ~/.ssh \( -name "*.pem" -o -name "*_sa" \) -exec ssh-add {} \; &>/dev/null
fi

