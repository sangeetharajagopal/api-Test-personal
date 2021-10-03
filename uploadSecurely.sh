proj_name="setmore"
server_username="reportsftp"
local_report_folder="./allure-report"
remote_report_folder="allure-report_"$(date "+%d-%m-%y-%H:%M:%S")
remote_filename="index.html"
keypath="./.secrets/report.ssh"

echo "Uploading $local_report_folder to server..."
#scp -C -q -i $keypath -P 2020 -r $reportpath reportsftp@testing-reports.setmore.com:/files/$proj_name/$filename
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -C -q -i $keypath -P 2020 -r $local_report_folder $server_username@testing-reports.setmore.com:/files/$proj_name/$remote_report_folder
echo 
echo "$local_report_folder copied to server."
echo "Find the report publicly available at https://testing-reports.setmore.com/$proj_name/$remote_report_folder/$remote_filename"

