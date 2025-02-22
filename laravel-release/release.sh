#!/bin/bash

# SSH接続情報
REMOTE_HOST="your.server.com"
REMOTE_USER="youruser"
REMOTE_PORT="22"
REMOTE_DIR="/var/www/your_project"
SWITCH_USER="yourdeployuser"

# SSHコマンドを実行
ssh -p $REMOTE_PORT $REMOTE_USER@$REMOTE_HOST << EOF

sudo su - $SWITCH_USER
cd $REMOTE_DIR
git checkout production
git pull origin production
composer install --no-interaction --prefer-dist --optimize-autoloader
php artisan migrate --force
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
npm install
npm run build
exit

EOF
