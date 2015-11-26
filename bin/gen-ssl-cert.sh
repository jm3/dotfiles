name=laundry.jm3.net
num_bits=2048

# via: https://devcenter.heroku.com/articles/ssl-certificate-self

echo "generate a private key (AES-128)"
openssl genrsa -aes128 -passout pass:x -out "${name}-pass-key.txt" ${num_bits}

echo doing some other unknown thing
openssl rsa -passin pass:x -in "${name}-pass-key.txt" -out "${name}-key.txt"
 
echo removing intermediate key
rm "${name}-pass-key.txt"

echo "generate the certificate"
openssl req -new -x509 \
  -days 3650 \
  -subj "/C=US/ST=CA/L=Los Angeles/O=CHROMALUME/CN=${name}" \
  -key "v1/${name}-key.txt" -out "${name}.crt" 

# alternatively:
# # generate a self-signed SSL cert
# touch example-cert.conf
# openssl req -new -x509 -days 365 -nodes -out example.crt -keyout example.key -config example.conf
# openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
# openssl rsa -passin pass:x -in server.pass.key -out server.key
# rm server.pass.key
# openssl req -new -key server.key -out server.csr
# openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
