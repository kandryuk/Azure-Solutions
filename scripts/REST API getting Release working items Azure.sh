tasks=$(curl -D- -u $(azureaccount):$(azuretoken) -X GET $(System.CollectionUri)$(System.TeamProject)/_apis/Release/releases/$(Release.DefinitionId)/workitems?api-version=6.0-preview |  sed 's/,/,\n/g' | sed -r -n '/(id").{6}\d*/p' | sed 's/["value":[{"id"]//g' | sed ':a;N;$!ba;s/\n//g' | sed 's/.$//')
echo $tasks
echo "##vso[task.setvariable variable=tasks]$tasks"