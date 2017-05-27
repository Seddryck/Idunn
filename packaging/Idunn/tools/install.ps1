param($installPath, $toolsPath, $package, $project)

#Change the copyOutputDirectory property for all files that have been added as part of the package
#$items = $project.ProjectItems | where-object {$_.Name -like "TestSuite.*"} 
#foreach ($item in $items) 
#{
#	$item.Properties.Item("CopyToOutputDirectory").Value = 2
#}

#Remove the file class1.cs (pointless)
#$project.ProjectItems("Class1.cs").Delete()

#Change the StartAction and Program
$projectName = $project.Name
$config = $project.ConfigurationManager.ActiveConfiguration
$config.Properties.Item("StartAction").Value = 1
$config.Properties.Item("StartProgram").Value = "$installPath\tools\Idunn.exe"
$config.Properties.Item("StartArguments").Value = "TestSuite.nunit /runselected"
$config.Properties.Item("StartWorkingDirectory").Value = "$installPath\..\..\$projectName\bin\debug\"