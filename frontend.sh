echo INSTALLING Nginx

echo Placing Expense Config File in Nginx
dnf install nginx -y >>/tmp/expense.log

echo Removing old Nginx Content
cp expense.conf /etc/nginx/default.d/expense.conf >>/tmp/expense.log

echo Download Frontend Content Code
rm -rf /usr/share/nginx/html/* >>/tmp/expense.log

curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>/tmp/expense.log

cd /usr/share/nginx/html

echo Extracting Frontend Code
unzip /tmp/frontend.zip >>/tmp/expense.log

echo Starting Nginx Service
systemctl enable nginx >>/tmp/expense.log
systemctl restart nginx >>/tmp/expense.log

