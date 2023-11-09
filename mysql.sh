source common.sh

echo Disable MYSQL 8 Version
dnf module disable mysql -y >>$log_file

echo Copy MYSQL Repo File
cp mysql.repo /etc/yum.repos.d/mysql.repo >>$log_file

echo Install MYSQL Server
dnf install mysql-community-server -y >>$log_file

echo start MYSQL Service
systemctl enable mysqld >>$log_file
systemctl start mysqld >>$log_file

echo Setup Root Pssword
mysql_secure_installation --set-root-pass ExpenseApp@1 >>$log_file
