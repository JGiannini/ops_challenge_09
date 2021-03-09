<#
Title: Log Retrieval via PowerShell
Author: Jamie Giannini

Tasks:
[X] Output all events from the System event log that occured in the last 24 hours to a file on your desktop named last_24.txt
[X] Output all "error" type events from the System event log to a file on your desktop named errors.txt 
[X] Print to the screen all events with ID of 16 from the System event log
[X] Print to the screen the most recent 20 entries from the System event log
[X] Print to the screen all sources of the 500 most recent entries in the System event log.
[X] Ensure that the full lines are displayed (get rid of the ... and show the entire text).

Stretch goals:
[X] Embed each task above into its own function, then call each function in main
[X] Ensure that full lines are displayed in the tasks abve  
#>

function log24_hour(){
$BeginDate = Get-Date -Date '3/7/2021 20:00:00' #Stores date in variable 
Get-EventLog -LogName System -After $BeginDate > last_24.txt #I then use the variable to output all events from System log after that time stored in $Begin to a text file
}


function log_error(){
Get-EventLog -LogName System -EntryType Error > errors.txt #Outputs all error events from system log to error.txt file
}


function print_all(){
Get-EventLog -LogName System -InstanceId 16 #Prints all events from the System log with ID 16
}


function print_recent(){
Get-EventLog -LogName System -Newest 20 #Prints only the 20 most recent events from the system log
}


function print_source(){
Get-EventLog -LogName System -Newest 500 | Select-Object -Property Source #Grabs the most recent 500 entries in the system log and prints just the Source information for each
}

function display_full(){
Get-EventLog -LogName System -Newest 50 | Format-Table -AutoSize #If I pipe to Format-Table I can use -Autosize to make sure all data is viewable (gets rid of the ... cutoff). Can also throw in -Wrap to wrap it all to a new line if needed
}

 
# Main - calls all functions
log24_hour
log_error
print_all
print_recent
print_source
display_full
