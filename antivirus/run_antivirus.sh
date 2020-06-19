clamscan -v -r --bell -i /usr/ 2>&1 | tee antivirus.log
clamscan -v -r --bell -i /etc/ 2>&1 | tee -a antivirus.log
clamscan -v -r --bell -i /opt/ 2>&1 | tee -a  antivirus.log
clamscan -v -r --bell -i /home/ 2>&1 | tee -a antivirus.log
#grep Infect antivirus.log
grep -v Scan antivirus.log

