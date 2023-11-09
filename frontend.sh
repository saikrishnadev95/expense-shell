source common.sh

echo INSTALLING Nginx
dnf install nginx -y >>$log_file

echo Placing Expense Config File in Nginx
cp expense.conf /etc/nginx/default.d/expense.conf >>$log_file

echo Removing old Nginx Content
rm -rf /usr/share/nginx/html/* >>$log_file

echo Download Frontend Content Code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>$log_file

cd /usr/share/nginx/html

echo Extracting Frontend Code
unzip /tmp/frontend.zip >>$log_file

echo Starting Nginx Service
systemctl enable nginx >>$log_file
systemctl restart nginx >>$log_file



