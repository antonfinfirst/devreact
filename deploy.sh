


#gitstatus=$(git pull | grep "Already up to date.")
#if  gitstatus = "Already up to date"
#get latest change from the github repository 
if [[ $(git pull | grep 'Already up to date.') = *Already* ]]; then 
	 echo "git is already update"
else	

#find the old running process and ill it 
prcoessid=$(ps -ef | grep node | awk '{print $2}')
kill all $prcoessid
kill -9 $prcoessid

#start the npm service which will start the service 
nohup npm start & 
fi

#validation of service andslack notification 

if curl -s --head --request GET http://localhost:7777 | grep "200 OK" > /dev/null; then
echo "react application is UP"
curl -X POST -H 'Content-type: application/json' --data '{"text":"react application is up"}' https://hooks.slack.com/services/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
else
echo "react application is DOWN"
curl -X POST -H 'Content-type: application/json' --data '{"text":"react application is DOWN"}' https://hooks.slack.com/services/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
fi
