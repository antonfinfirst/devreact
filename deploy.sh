


#gitstatus=$(git pull | grep "Already up to date.")
#if  gitstatus = "Already up to date"
if [[ $(git pull | grep 'Already up to date.') = *Already* ]]; then 
	 echo "git is already update"
else	

git checkout "patch-1"
prcoessid=$(ps -ef | grep node | awk '{print $2}')
kill all $prcoessid
kill -9 $prcoessid
nohup npm start & 
fi
